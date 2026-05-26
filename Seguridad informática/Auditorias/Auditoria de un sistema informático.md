#Manuales #Servidores #Ciberseguridad
Proveniente de [[Auditoria]]
**Implantación de Sistemas Operativos en Red - RA7**

**Sebastian Ariel Duarte Oruez**
**Curso 25/26**

---
![[RedHat.png]] ![[SELinux.svg]]

![[Auditoria]]

---
# Índice
```table-of-contents
```

---
# Entorno a auditar
El sistema operativo que vamos a auditar es un RHEL 10. 
Se pueden ver las características completas con un `fastfetch`:
![[rhel10Fastfetch.png]]
## 1. Preparación del sistema y configuración de rendimiento
En RHEL 10, el demonio `audit` es la base de la traza de eventos. Aseguramos su instalación y optimizamos el comportamiento del demonio para evitar la pérdida de vectores de ataque por saturación del disco:
```shell
sudo dnf install audit policycoreutils-python-utils -y
sudo systemctl enable --now auditd
```
![[install&enableaudit.png]]

##### Optimización en `/etc/audit/auditd.conf`
Modificamos los parámetros por defecto para garantizar entornos de alta disponibilidad:
```ini
max_log_file = 100
# aumentar el limite a 100MB por archivo
max_log_file_action = ROTATE
# evita la denegacion de servicio por disco lleno rotando logs de manera segura
```
![[Pasted image 20260524233032.png]]

## 2. Gestión de identidades y Control de acceso Local
Supervisa de forma granular cualquier intento de lectura, escritura o modificacion de los atributos de los archivos que gobiernan los usuarios y privilegios locales.
```shell
# Vigilancia sobre la base de datos de usuarios locales 
sudo auditctl -w /etc/passwd -p rwa -k gestio_identitats 

# Vigilancia sobre el almacén de hashes de contraseñas de cuentas 
sudo auditctl -w /etc/shadow -p rwa -k gestio_identitats 

# Vigilancia sobre los grupos del sistema 
sudo auditctl -w /etc/group -p rwa -k gestio_identitats
```
![[Pasted image 20260524233244.png]]

## 3. Auditoría de escalada de privilegios y uso de Sudo
Es imperativo capturar las modificaciones en las políticas de elevación de privilegios y supervisar el uso de comandos administrativos.
```shell
# Monitorización de las reglas de sudoers (fichero base y directorio dinámico)
sudo auditctl -w /etc/sudoers -p wa -k escalada_privilegis
sudo auditctl -w /etc/sudoers.d/ -p wa -k escalada_privilegis

# Registrar la ejecución (x) de los binarios nativos de transición de privilegios
sudo auditctl -w /usr/bin/sudo -p x -k exec_privilegis
sudo auditctl -w /usr/bin/su -p x -k exec_privilegis
```
![[Pasted image 20260524233409.png]]

## 4. Configuración Central y Auditoría Estricta de Firewalld
RHEL 10 implementa `firewalld` para la gestión perimetral. Además de auditar el directorio de configuración, usaremos el propio sistema de logging de `firewalld` y `auditd` para capturar cualquier manipulación.
```shell
# Monitorizar cambios directos en los XMLs de configuración del firewall
sudo auditctl -w /etc/firewalld/ -p wa -k canvis_firewall
```
![[Pasted image 20260524233451.png]]
##### Auditoría Activa de Paquetes Denegados en Firewalld
Para que el firewall informe a los logs del sistema sobre paquetes sospechosos o ataques de escaneo de puertos, configuramos el parámetro `LogDenied`:
```shell
# Configurar el registro de paquetes descartados (all, unicast, broadcast, o multicast)
sudo firewall-cmd --set-log-denied=all

# Recargar de forma permanente para aplicar los cambios sin perder conexiones
sudo firewall-cmd --reload
```
![[Pasted image 20260524233634.png]]
*Los paquetes bloqueados se registrarán directamente en el kernel y se podrán visualizar con `dmesg` o `journalctl -xef` bajo la etiqueta `FILTER` o `REJECT`.*

## 5. Auditoría y Control de Eventos de SELinux (AVC)
SELinux (Security-Enhanced Linux) es vital en RHEL 10. Bloquea acciones basándose en contextos de seguridad, e inyecta alertas **AVC (Access Vector Cache)** directamente en `auditd` cuando un proceso intenta romper su confinamiento.
##### Verificación del Estado de SELinux
El sistema debe operar obligatoriamente en modo restrictivo (`Enforcing`):
```shell
# Comprobar el estado actual
sestatus
```
![[Pasted image 20260524233728.png]]

##### Auditoría de Alertas de Denegación (AVC)
Cuando un servicio (por ejemplo, un servidor web) intenta acceder a un directorio sin el contexto correcto, SELinux lo frena. Para auditar estas denegaciones específicas:
```shell
# Buscar denegaciones de SELinux recientes de forma interactiva y legible
sudo ausearch -m AVC -ts recent -i

# Generar un informe detallado con sugerencias de reparación (utilizando sealert)
sudo sealert -a /var/log/audit/audit.log
```
![[Pasted image 20260524233809.png]]
##### Deshabilitar "Dontaudit" para Auditorías Profundas
Por defecto, SELinux silencia ciertas denegaciones comunes para no inundar los logs. Si estás realizando una auditoría forense rigurosa, puedes forzar a SELinux a registrar **absolutamente todo**:
```shell
# Desactivar la supresión de alertas ocultas
sudo semodule -DB

# (Opcional) Volver a activar el filtrado por defecto tras la auditoría
sudo semodule -B
```
## 6. Control de Accesos y Autenticación Remota (SSH y PAM)
La monitorización de las sesiones SSH remotas y el comportamiento de los módulos PAM de autenticación local se consolida vigilando el diario de seguridad.
```shell
# Monitorizar alteraciones o truncados en el log de accesos protegidos
sudo auditctl -w /var/log/secure -p wa -k registres_autenticacio

# Monitorizar modificaciones en el demonio OpenSSH de producción
sudo auditctl -w /etc/ssh/sshd_config -p wa -k config_central
```
![[Pasted image 20260524234005.png]]
##### Análisis Forense de Sesiones
```shell
# Extraer todos los fallos de autenticación ssh/local en tiempo real
sudo ausearch -m USER_LOGIN,USER_AUTH -sv no -i
```
![[Pasted image 20260524234109.png]]
```ini
type=USER_AUTH msg=audit(23/04/26 20:07:34.404:580) : pid=26741 uid=root auid=unset ses=unset subj=system_u:system_r:cockpit_session_t:s0 msg='op=PAM:authentication grantors=? acct=admin exe=/usr/libexec/cockpit-session hostname=::ffff:192.168.119.20 addr=::ffff:192.168.119.20 terminal=? res=failed' 
```

## 7. Auditoría de Eventos Críticos del Kernel y Llamadas al Sistema
Para evitar que un atacante enmascare sus acciones modificando la hora del sistema, alterando el hostname o inyectando rootkits en el espacio del kernel, auditamos las _syscalls_ directas:
```shell
# Monitorear la alteración del reloj del sistema (manipulación cronológica de logs)
sudo auditctl -a always,exit -F arch=b64 -S adjtimex,settimeofday,clock_settime -k canvi_hora

# Monitorear alteración del nombre del nodo/servidor
sudo auditctl -a always,exit -F arch=b64 -S sethostname,setdomainname -k config_central

# Monitorear inserción y remoción de módulos del Kernel
sudo auditctl -a always,exit -F arch=b64 -S init_module,finit_module,delete_module -k moduls_kernel
```
![[Pasted image 20260524234327.png]]

## 8. Protección de la Integridad de Logs y Binarios del Sistema
```shell
# Detectar intentos de manipulación del propio motor de reglas de auditd
sudo auditctl -w /etc/audit/ -p wa -k configuracio_audit

# Detectar accesos no autorizados al directorio de almacenamiento de logs de auditoría
sudo auditctl -w /var/log/audit/ -p wa -k alerta_manipulacio_logs
```
![[Pasted image 20260524234527.png]]

## 9. Persistencia, Inmutabilidad y Despliegue de **Reglas**
Para que esta arquitectura híbrida de seguridad (`auditd` + `SELinux` + `Firewalld`) persista tras un reinicio del servidor, volcamos el set de reglas plano directamente en el archivo de configuración estructurado de RHEL 10:
```shell
sudo bash -c 'cat > /etc/audit/rules.d/audit.rules <<EOF
# Limpiar configuración en memoria
-D

# Ajustar tamaño del búfer de ráfagas de eventos
-b 16384

# Estructura de Persistencia

# 1. Identidades e Infraestructura de Cuentas
-w /etc/passwd -p rwa -k gestio_identitats
-w /etc/shadow -p rwa -k gestio_identitats
-w /etc/group -p rwa -k gestio_identitats

# 2. Control de Elevación de Privilegios
-w /etc/sudoers -p wa -k escalada_privilegis
-w /etc/sudoers.d/ -p wa -k escalada_privilegis
-w /usr/bin/sudo -p x -k exec_privilegis
-w /usr/bin/su -p x -k exec_privilegis

# 3. Seguridad Perimetral y Red (Firewalld y NetworkManager)
-w /etc/firewalld/ -p wa -k canvis_firewall
-w /etc/NetworkManager/system-connections/ -p wa -k canvis_xarxa
-w /etc/ssh/sshd_config -p wa -k config_central

# 4. Integridad de los Sistemas de Registro e Historiales
-w /var/log/secure -p wa -k registres_autenticacio
-w /var/log/audit/ -p wa -k alerta_manipulacio_logs
-w /etc/audit/ -p wa -k configuracio_audit

# 5. Llamadas de Bajo Nivel al Kernel
-a always,exit -F arch=b64 -S adjtimex,settimeofday,clock_settime -k canvi_hora
-a always,exit -F arch=b64 -S sethostname,setdomainname -k config_central
-a always,exit -F arch=b64 -S init_module,finit_module,delete_module -k moduls_kernel

# 6. Captura de Errores Críticos de Permisos (Intrusiones)
-a always,exit -F arch=b64 -S open,openat -F success=0 -F auid>=1000 -F auid!=4294967295 -k errors_acces

# INMUTABILIDAD CRÍTICA: Bloquea la edición de las reglas en caliente
-e 2
EOF'
```
***Bloqueo de Inmutabilidad (-e 2):** Al consolidar con `-e 2`, el motor de auditoría del kernel ignora cualquier intento de desactivación mediante `auditctl` en caliente. Solo se podrá modificar editando el archivo físico y **reiniciando por completo el nodo**.

## 10. Veredicto y Cumplimiento de Estándares (Compliance)
- **Estat de Securització:** Con la convergencia de `auditd` para la traza forense, la interceptación de llamadas del kernel, las alertas AVC de `SELinux` aislando procesos y el volcado de denegaciones de `firewalld`, la máquina RHEL 10 cumple holgadamente con los estándares de endurecimiento más estrictos del sector (**CIS Benchmark Nivel 2** y **STIG de DISA**).

- **Eficiencia Operativa:** Al filtrar eventos por arquitectura de CPU (`arch=b64`) y aislar usuarios del sistema (`auid>=1000`), el entorno de monitorización se mantiene sumamente ligero, garantizando que el consumo de recursos de computación y de E/S de almacenamiento en producción sea mínimo.