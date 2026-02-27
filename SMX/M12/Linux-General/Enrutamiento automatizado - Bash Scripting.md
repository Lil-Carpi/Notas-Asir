![[Linux - Esquema básico de enrutamiento.canvas|Linux - Esquema básico de enrutamiento]]

#### Si quieres entender mejor el enrutamiento, mira esto ☝️.

>**_💡 NOTA: El archivo "rc.local" esta deprecated. Busca una alternativa si quieres utilizar esto para un servidor serio._**

Para que el servidor haga el enrutamiento automaticamente, hemos de poner en el archivo `/etc/rc.local` lo siguiente:

``` bash
#!/bin/bash 
iptables -t nat -F 
iptables -F 
iptables -X 
iptables -t nat -X 
iptables -Z 
iptables -P INPUT DROP 
iptables -P FORWARD DROP 
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -i enp0s3 -j ACCEPT 
iptables -A INPUT -i enp0s8 -j ACCEPT 
iptables -A INPUT -i enp0s3 -m conntrack --ctstate ESTABLISHED,RELATED
iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT 
iptables -A FORWARD -i enp0s3 -o enp0s8 -m conntrack --ctstate ESTABLISHED,RELATED
iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE 
echo "1" > /proc/sys/net/ipv4/ip_forward 
exit 0
```

damos permisos de ejecución:

```shell
chmod +x /etc/rc.local
```

y ejecutamos:

```shell
cd /etc ; ./rc.local
```

### Si nos da algún tipo de error, debemos de verificar la sintaxis.

Script de enrutamiento (en caso de pasar por ssh desde una maquina Windows a un linux server para la prueba, se debe de instalar el programa `dos2unix` con:
```shell
sudo apt install dos2unix
#convertir el fichero en unix-type:
dos2unix script.sh
```
):

```shell
#!/bin/bash
function interfaces(){
    read -p "[?] ¿Conoces tus interfaces (Y/n)? " intpreg
    intpreg=${intpreg:-Y}

    if [[ "$intpreg" =~ ^[Yy]$ ]]; then
        read -p "[-] Interfaz interna: " intinter
        read -p "[-] Interfaz externa: " ifaceex
    else
        read -p "[?] ¿Deseas que las detecte automáticamente? (Y/n) " intdetect
        intdetect=${intdetect:-Y}

        if [[ "$intdetect" =~ ^[Yy]$ ]]; then
            echo "[-] Detectando Interfaces..."
            sleep 2
            echo "[|] Detectando Interfaces con IP"
            intercip=$(ip -o -4 addr show | awk '$2 != "lo" {print $2}')
            sleep 3
            echo "[-] Detectando todas las Interfaces"
            tlinter=$(ip -o link show | awk -F': ' '$2 != "lo" {print $2}')
            sleep 1
            total=$(echo "$tlinter" | wc -l)
            if [ "$total" -lt 2 ]; then
                echo "[X] No tienes 2 interfaces disponibles -_- bobo"
                exit 1
            fi
            internal_candidates=""
            external_candidate=""
            for iface in $tlinter; do
                if ! echo "$intercip" | grep -q "^$iface$"; then
                    echo "[~] $iface no tiene IP (posible interfaz interna)"
                    internal_candidates="$internal_candidates $iface"
                else
                    external_candidate="$iface"
                fi
            done

            if [[ -z "$internal_candidates" ]]; then
                echo "[X] No se pudo identificar una interfaz interna sin IP."
                read -p "[-] Por favor, introduce el nombre de la interfaz interna: " intinter
            elif [[ $(echo "$internal_candidates" | wc -w) -eq 1 ]]; then
                intinter=$(echo "$internal_candidates")
                echo "[-] Interfaz interna detectada: $intinter"
            else
                echo "[?] Se encontraron varias posibles interfaces internas: $internal_candidates"
                read -p "[-] Por favor, introduce el nombre de la interfaz interna: " intinter
            fi

            if [[ -z "$external_candidate" ]]; then
                echo "[X] No se pudo identificar una interfaz externa con IP."
                read -p "[-] Por favor, introduce el nombre de la interfaz externa: " ifaceex
            else
                ifaceex="$external_candidate"
                echo "[-] Interfaz externa detectada: $ifaceex"
            fi

        else
            read -p "[-] Interfaz interna: " intinter
            read -p "[-] Interfaz externa: " ifaceex
        fi
    fi
}
function ipcidr(){
        read -p "[?] ¿Que direccion IP sera la interna? " ipinter
        read -p "[?] ¿Que CIDR tendra? " cidrinter
	read -p "[?] ¿Que DNS primario? (obligatorio) " dnsprim
	read -p "[?] ¿Que DNS secundario? (obligatorio) " dnssec
}
function enrutamiento(){
        echo "[-] Creando archivo rc.local..."
	sleep 2
        echo "[-] requiere superusuario... "
        sudo touch /etc/rc.local
	sudo bash -c "cat > /etc/rc.local" <<EOF
#!/bin/bash
iptables -t nat -F
iptables -F
iptables -X
iptables -t nat -X
iptables -Z
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i $ifaceex -j ACCEPT
iptables -A INPUT -i $intinter -j ACCEPT
iptables -A INPUT -i $ifaceex -m conntrack --ctstate ESTABLISHED,RELATED
iptables -A FORWARD -i $intinter -o $ifaceex -j ACCEPT
iptables -A FORWARD -i $ifaceex -o $intinter -m conntrack --ctstate ESTABLISHED,RELATED
iptables -t nat -A POSTROUTING -o $ifaceex -j MASQUERADE
echo "1" > /proc/sys/net/ipv4/ip_forward
ufw disable
exit 0
EOF
        cd /etc/
        echo "[-] Editando permisos..."
	sleep 1
        sudo chmod +x rc.local
        echo "[-] Ejecutando..."
	sleep 2
        sudo ./rc.local
        echo "[✓] Archivo de configuracion creado y ejecutado. Puede revisarlo en /etc/rc.local"
}

function netplan(){
	sleep 1
    echo "[-] Configurando netplan"
    sleep 2
    echo "[-] requiere superusuario"
    sudo bash -c "cat > /etc/netplan/00-installer-config.yaml <<EOF
network:
  version: 2
  ethernets:
    $ifaceex:
      dhcp4: true
    $intinter:
      addresses:
        - $ipinter/$cidrinter
      nameservers:
        addresses:
          - $dnsprim
          - $dnssec

EOF"

    sudo netplan apply
    echo "[✓] Configuracion Netplan aplicada..."

}
#==========^^^^^^^^ENRUTAMIENTO^^^^^^^^============
echo "Bienvenido al automatizador de tareas | By Lil_Carpi"
echo "Si deseas conocerme mas, puedes ingresar a mi pagina"
echo "web (https://lilcarpi.duckdns.org)"
echo ""
echo "//======================LISTA====================\\"
echo "|| 1- Enrutamiento                               ||"
echo "|| 2- Pagina Web (requiere directorios ya hechos)||"
echo "||    |- Tambien configura salida a internet :)  ||"
echo "|| 3- Configuracion Proxy                        ||"
echo "|| 4- Configuracion DHCP                         ||"
echo "\\===============================================//"

echo ""
echo "[?] ¿Que opcion deseas elegir?"
read opcion

if [[ $opcion == "1" ]]; then
        ipcidr
        interfaces
        enrutamiento
        netplan
echo "[✓] Configuracion aplicada. Verifica que los equipos tengan conexion a internet."
echo "[!] Archivos modificados o creados: /etc/rc.local | /etc/netplan/00-installer-config.yaml | /proc/sys/net/ipv4/ip_forward"
else
        echo "[X] $opcion no es un valor valido. Adios >:|"
fi
```