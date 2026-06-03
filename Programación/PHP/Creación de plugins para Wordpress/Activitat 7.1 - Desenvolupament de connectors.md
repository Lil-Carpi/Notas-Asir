Proveniente de [[Índice - PHP]]
#PHP #Manuales 
---

**RA7. Realitza modificacions en gestors de continguts**
**M9: Implantacio d'aplicacions WEB**

***Sebastian Ariel Duarte Oruez***
Curs 25/26
---
# Índice
```table-of-contents
```
---
## Llaves SSH
Antes de crear el plugin y hacer las sincronizaciones, tenemos que asegurarnos de que tenemos pasado la clave SSH al servidor para poder evitarnos poner la contraseña una vez.

Generamos la clave publica privada ed25519:
```shell
ssh-keygen -t ed25519 -C "Per-Sincronitzacions"
```
![[php_keygen.png]]

Generamos los pares de llaves rsa y se los pasamos al servidor:
```shell
ssh-keygen -t rsa -b 4096
ssh-copy-id carpi@192.168.100.106
ssh-copy-id -i .ssh/id_ed25519.pub carpi@192.168.100.106
```
![[Pasted image 20260511190206.png]]

Una vez pasadas las claves y nos podemos conectar, continuamos.

---
## Instalacion de wordpress
Nos descargamos el WordPress de la pagina oficial y lo pasamos al servidor
![[Pasted image 20260511193839.png]]
Lo descomprimimos en `/var/www/html`
```shell
mv wordpress* /var/www/html
sudo unzip wordpress*
```
>[!nota]
>Es posible que en las capturas siguientes, como en la del script de sincronizacion, se vea que la ruta es `/var/www/wordpress`.

Una vez pasado, le pasamos la propiedad del directorio entero al usuario apache
![[Pasted image 20260511195023.png]]

Instalamos las dependencias de wordpress
![[Pasted image 20260511194312.png|697]]
![[Pasted image 20260511200127.png]]
```shell
sudo dnf install httpd mariadb-server php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-xml php-zip php-mysqli -y
```
---
### Base de datos
 Para la base de datos, solo hace falta crear la base de datos de wordpress y el usuario wordpress. A este usuario le damos los 3permisos totales sobre la base de datos de wordpress.
![[Pasted image 20260511195252.png]]
---
#### Cortafuegos
Configuramos el cortafuegos para permitir el paso del puerto `80` y el `443`:
![[Pasted image 20260511195537.png]]

---
#### Activar servicio apache
Activamos el servicio de apache:
![[Pasted image 20260511195656.png]]

---
#### SELinux
Para la configuracion de SELinux, usamos semanage para el contexto de las etiquetas de propiedad. Ademas de esto, tenemos que limpiar el contexto de las etiquetas con restorecon y permitir que apache pueda acceder a la base de datos activando el binario http y httpd_can_network_connect_db
![[Pasted image 20260511200024.png|697]]

```SELinux
sudo restorecon -Rv /var/www/html
```

---
## Plugin
En mi caso, este plugin es uno simple. Lo he llamado "Pacman en el footer". Basicamente añade un gif de pacman dentro de un recuadro en el footer de tanto el frontend como en el backend:
![[Pasted image 20260522205404.png]]
![[Pasted image 20260522205559.png]]

En el front-end, añade también el texto ` (C····)` al costado derecho del título.



---
### Estructura

La estructura del plugin es la siguiente:
```shell
carpi@BodoqueRH ~/wp> tree
.
├── sado-pl1-pacman
│   ├── assets
│   │   ├── css
│   │   │   └── pacman-style.css
│   │   └── img
│   │       └── pacman.gif
│   ├── includes
│   │   └── functions.php
│   ├── pacman-footer.php
│   └── uninstall.php
└── sync.sh

6 directories, 7 files
```

---
### Sincronización entre entorno de desarrollo y producción
En la raíz, tenemos el script de sincronización, el cual es el siguiente:
```shell
#!/bin/bash

rsync -avz --delete --rsync-path="sudo rsync" /home/carpi/wp/sado-pl1-pacman/ carpi@192.168.100.106:/var/www/html/wp-content/plugins/sado-pl1-pacman

ssh -t carpi@192.168.100.106 "sudo chown -R apache:apache /var/www/html/wp-content/plugins/sado-pl1-pacman && sudo chmod 755 -R /var/www/html/wp-content/plugins/sado-pl1-pacman && sudo restorecon -Rv /var/www/html/wp-content/plugins/sado-pl1-pacman"
```

Son dos líneas que, con rsync, sincroniza el directorio de producción con el de desarrollo cada que se ejecuta. 
**El comando rsync nos permite, como he dicho antes, sincronizar los directorios.**
Los parámetros son:
`-a` (archive): Mantiene permisos, fechas, enlaces simbólicos, etc.
`-v` (verbose): Muestra en pantalla qué archivos se están copiando.
`-z` (compress): Comprime los datos durante la transferencia para que sea más rápido.
`--delete`: Si un archivo de la carpeta de desarrollo se borra, el script lo borrará también en el servidor remoto. 
`--rsync-path="sudo rsync"`: Esto es necesario porque el destino (`/var/www/html/...`) suele pertenecer al usuario `root` o al usuario del servidor web (`apache`). Al usar `sudo` en el servidor, permites que `rsync` escriba en carpetas protegidas.
`La ruta` : Sincroniza desde tu equipo local hacia la IP `192.168.100.106`.

En la segunda línea, tenemos la conexión remota.
Los parámetros son:
`ssh -t`: Se conecta al servidor remoto y ejecuta los comandos encerrados entre comillas. El parámetro `-t` fuerza la asignación de un terminal, algo necesario para poder escribir la contraseña de `sudo` si fuera requerida.

`sudo chown -R apache:apache ...`: Cambia el propietario y el grupo de todos los archivos copiados a `apache`. Con esto nos aseguramos de que apache pueda ejecutarlos.
`sudo chmod 755 -R ...`: Establece los permisos de lectura, escritura y ejecución.
`755`: Permiso clásico para que solo el dueño del fichero pueda leer, escribir y ejecutar. Los demás solo leer y ejecutar.
  
`sudo restorecon -Rv ...`: Comando de SELinux (uso Fedora Server). Corrige los contextos de seguridad para que el sistema permita a Apache acceder a los archivos que se suben con la sincronización. Si no se hace esto, SELinux creerá que los ficheros son del usuario y se los bloqueará a apache. 

Además de esta configuración, también he tenido que hacer algunos cambios en sudoers:
![[Pasted image 20260522211007.png]]
Esto, nos servirá para que nos deje editar como sudo los ficheros con el rsync. Igual acaba pidiendo contraseña, aunque se ponga el NOPASSWD . Esto pasa por los otros comandos que se pasan por SSH. La solución sería ponerle nopasswd a chmod, restorecon, etc. pero sería un riesgo de seguridad muy alto para algo tan simple como pasar ficheros de un host a un servidor.
```shell
carpi ALL=(ALL) NOPASSWD: /usr/bin/rsync *, /usr/bin/chown, /usr/bin/chmod, /usr/sbin/restorecon
```

---
#### Ficheros del plugin
Como el codigo en si ya esta documentado, no hace falta que lo explique demasiado.

##### /pacman-footer.php
```PHP
<?php
/**
* Plugin Name: Pacman en el footer
* Description: Añade el gif de un Pacman en el footer del frontend y del panel de administrador.
* Version: 1.0.0
* Author: Sebastian Ariel Duarte Oruez
* License: GPL-2.0+
*/

if ( ! defined( 'ABSPATH' ) ) {
exit;
}
// Evita ejecutar directamente.
// por ejemplo, si algun macana va directo a:
// http://wp.duarte.local/wp-content/plugins/plugindir/includes/functions.php
// el server lo va a procesar pero de manera aislada. Como wordpress no se ha cargado,
// la funcion add_action() no va a existir y va a escupir un Fatal Error y revelando la estructura de directorios
// he dejado una imagen en el comprimido llamado `ejemplo_de_ejecutar_directamente.png` para que lo veas.

define ( 'SADO_PL1_PLUGIN_DIR', plugin_dir_url( __FILE__) );
// separar las funciones logicas en un fichero aparte.

require_once plugin_dir_path( __FILE__ ) . 'includes/functions.php';
// llama una vez al fihero de funciones logicas.

?>
```

##### /include/functions
```php
<?php
/**
 * Funciones logicas del plugin "Pacman en el footer"
 */
if ( ! defined( 'ABSPATH' ) ) {
    exit;
} // la misma cosa que en el pacman-footer.php


// pa añadir el plugin en la sidebar de la izquierda de los ajustes del wordpress
function sado_pl1_add_admin_menu() {
    add_options_page(
        'Configuracion Pacman', // titulo de la pestaña en el navegador
        'Pacman Footer', // Nombre que sale en el menu de la izquierda (en ajustes)
        'manage_options', // Solo los admins pueden tocar esto
        'sado_pl1_pacman_options', // el id unico de la pagina 
        'sado_pl1_render_admin_page' // la funcion de abajo que dibuja el html
    );
}
// le hace el paste en el menu cuando wordpress carga el panel de control.
add_action ( 'admin_menu', 'sado_pl1_add_admin_menu' );

// registra la config, la seccion  y el checkbox en los ajustes API de wordpress
function sado_pl1_settings_init() {
    // registra la variable en la db para que se guarde de verdad
    register_setting( 'sado_pl1_settings_group', 'sado_pl1_pacman_active' );

    // crea el bloque general de opciones en la pagina de administracion.
    add_settings_section(
        'sado_pl1_section_id',
        'Ajustes de Pacman',
        '__return_false', // no necesitamos meter texto extra en la cabecera de la seccion
        'sado_pl1_pacman_options'
    );

    // vincula el campo del checkbox con la seccion de arriba.
    add_settings_field(
        'sado_pl1_field_active',
        'Activar Pacman en el Footer',
        'sado_pl1_callback_field_active', // llama ala funcion de abajo para pintar el imput
        'sado_pl1_pacman_options',
        'sado_pl1_section_id'
    );
}
// incia la configuracion en el arranque del backend
add_action ( 'admin_init', 'sado_pl1_settings_init' );

// pinta el checkbox html en la administracion (pa âttibâh y deçâttibâh <-(esto es andalûh por cierto))
function sado_pl1_callback_field_active() {
    // busca si ya estaba guardado. Si no hay nada, pone '0' por defecto.
    $value = get_option( 'sado_pl1_pacman_active', '0' );
    // el checked() de wordpress deja la casilla marcada automatiamente si vale 1 en la db
    echo '<input type="checkbox" name="sado_pl1_pacman_active" value="1" ' . checked( 1, $value, false ) . ' /> Activar visible globalmente';
}

// renderiza la interfaz grafica de la pagina de opciones del plugin
function sado_pl1_render_admin_page() {
    ?>
    <div class="wrap">
        <h1>Configuracion del Pacman Footer</h1>
        <form action="options.php" method="POST">
            <?php
            // inyecta los campos ocultos de seguridad (nonces) del grupo
            settings_fields( 'sado_pl1_settings_group' );
            //pinta las secciones y campos que estan registrados arriba
            do_settings_sections( 'sado_pl1_pacman_options' );
            // el boton azul de wordpress pa guardar los cambios
            submit_button();
            ?>
        </form>
    </div>
    <?php
}

// ---vaina del frontend---

// si el checkbox esta activo, encasqilla el css
function sado_pl1_enqueue_styles() {
    // si esta activo (1) en la db, se carga el css
    if ( get_option( 'sado_pl1_pacman_active' ) == '1' ) {
        wp_enqueue_style( 'sado-pl1-styles', SADO_PL1_PLUGIN_DIR . 'assets/css/pacman-style.css' );
    }
}

// carga los estilos tanto en el frontend como en el backend.
add_action ( 'wp_enqueue_scripts', 'sado_pl1_enqueue_styles' );
add_action ( 'admin_enqueue_scripts', 'sado_pl1_enqueue_styles' );


// renderiza el marco del pacman con las cajitas div en el footer
function sado_pl1_render_pacman_footer() {
    // si el checkbox no esta activo, return.
    if ( get_option( 'sado_pl1_pacman_active' ) != '1' ) {
        return;
    }

    // se usa la constante del archivo principal para buscar el gif
    $gif_url = SADO_PL1_PLUGIN_DIR . 'assets/img/pacman.gif';
    ?>
    <div class="sado-pl1-pacman-container">
        <div class="sado-pl1-pacman-div">
            <div class="sado-pl1-pacman-indiv">
                <img src="<?php echo esc_url( $gif_url ); ?>" alt="Pacman" class="sado-pl1-gif">
                <span class="sado-pl1-dots">C····</span>
            </div>
        </div>
        <div class="sado-pl1-copyright">
            Pacman y derivados pertenecen a la compañía Bandai Namco Entertainment
        </div>
    </div>
    <?php
}

// pon todo lo de antes en el footer del backend y frontend.
add_action( 'wp_footer', 'sado_pl1_render_pacman_footer' );
add_action( 'admin_footer', 'sado_pl1_render_pacman_footer' );


// Pone los puntitos C··· al costado del gif del pacman
function sado_pl1_filter_pacman_title( $title ) {
    // si esta encendido y el titulo se pinta dentro del bucle clasico, lo altera.
    if ( get_option( 'sado_pl1_pacman_active' ) == '1' && in_the_loop() ) {
        return $title . ' (C····)';
    }
    // si no se cumple, devuielve el titulo original de la db.
    return $title;
}
// engancha el fltro para interceptar el titulo antes de imprimirlo en pantalla.
add_filter( 'the_title', 'sado_pl1_filter_pacman_title' );
?>
```

##### /uninstall.php
```php
<?php
if ( ! defined( 'WP_UNINSTALL_PLUGIN' ) ) {
    exit;
}
//borra :)
delete_option( 'sado_pl1_pacman_active' );
?>
```

##### /assets/css/pacman-style.css
```css
/* Contenedor principal que agrupa todo el componente */
.sado-pl1-pacman-container {
    position: fixed;            /* Fija la posición del elemento en la ventana */
    bottom: 20px;               /* Separación desde la parte inferior */
    left: 50%;                  /* Alineación horizontal centrada */
    transform: translateX(-50%);/* Ajuste fino para centrarlo exactamente */
    z-index: 999999;            /* Asegura que siempre esté por encima de otros elementos */
    pointer-events: none;       /* Desactiva clics sobre el contenedor (se vuelve invisible al mouse) */
    border: 1px solid #455069;  /* Define el borde con color azul grisáceo */
    border-radius: 20px;        /* Redondea las esquinas del contenedor */
    background-color: lightgrey;/* Color de fondo base gris claro */
}

/* Estilos específicos para la imagen dentro del contenedor */
.sado-pl1-pacman-container img {
    width: 90px;                /* Anchura fija de 90px */
    height: auto;               /* Altura automática para mantener proporción */
    display: block;             /* Elimina espacio extra inferior por ser un elemento en bloque */
    border-radius: 10px;        /* Redondea las esquinas de la imagen */
}

/* Capa de fondo que envuelve al contenido interno */
.sado-pl1-pacman-div {
    background-color: #00c3ff;  /* Color azul cian */
    border-radius: 20px;        /* Esquinas redondeadas para coincidir con el diseño */
}

/* Contenedor interno que organiza el diseño flexible */
.sado-pl1-pacman-indiv {
    background-color: #172746;  /* Color azul oscuro para contraste */
    border-radius: 20px;        /* Esquinas redondeadas */
    display: flex;              /* Activa Flexbox para alinear elementos */
    padding: 10px 0 10px 20px;  /* Relleno interno (arriba, derecha, abajo, izquierda) */
    margin-left: 10px;          /* Separación del margen izquierdo */
    align-items: center;        /* Centra verticalmente los elementos internos */
    justify-content: flex-start;/* Alinea el contenido hacia el inicio (izquierda) */
}

/* Estilos para el texto de los puntos */
.sado-pl1-dots {
    font-size: 22px;            /* Tamaño de letra grande */
    font-weight: 600;           /* Peso de letra seminegrita */
    letter-spacing: 3px;        /* Espaciado extra entre cada punto */
    margin-left: 25px;          /* Separación respecto a la imagen */
    color: white;               /* Color blanco para mejor visibilidad */
}

/* Estilos para el pie de página de copyright */
.sado-pl1-copyright {
    font-size: 10px;            /* Tamaño de fuente pequeño */
    text-align: center;         /* Centrado horizontal del texto */
    white-space: nowrap;        /* Evita que el texto se parta en varias líneas */
    opacity: 0.8;               /* Aplica una ligera transparencia */
    margin: 10px;               /* Margen exterior para espacio */
}
```

---
## Funcionamiento del plugin
Como dije antes, es un plugin muy sencillo que añade un pacman en el footer de tanto el backend como el frontend. Ademas de esto, en el frontend al lado del titulo pone el texto ` (C····)`.

#### Frontend:
> Plugin activo:
![[Pasted image 20260522213443.png]]
![[Pasted image 20260522213527.png]]
![[Pasted image 20260522213539.png]]

>Plugin inactivo:
![[Pasted image 20260522213555.png]]

#### Backend:
##### Vista en la lista de plugins:
![[Pasted image 20260522213644.png]]
>Así queda si se borra:
![[Pasted image 20260522213715.png]]

> Barra lateral:
![[Pasted image 20260522213804.png]]

> Dentro de los ajustes del plugin
![[Pasted image 20260522213928.png]]

>Cuando se activa:
![[Pasted image 20260522213859.png]]
##### Plugin activo en otras partes del backend:
![[Pasted image 20260522214000.png]]
![[Pasted image 20260522214013.png]]

