Acceder a un disco duro con Windows puede ser una tarea fácil, pero no tanto cuando este se encuentra encriptado con [[Bitlocker]] y no es posible descifrarlo mediante software. Para ello, se ha inventado un pequeño tool llamado TPM SNIFFER montado en un Raspberry Pico (de ahí el nombre PICO TPM SNIFFER).

![[pico_tpm_sniffer.webp]]

Este funciona con hardware y software, el cual permite que se pueda leer la transmisión de datos entre el TPM y un TPM externo. Solamente funciona con dispoitivos que tengan el TPM soldado a la placa base.

Existe un pequeño bus LPC por el cual se inserta un TPM externo, y justamente esta comunicacion es la que se encuentra sin cifrar. Esto permite robar datos mientras se transmiten entre las unidades de CPU y TPM.

Se emplea un pequeño Raspberry Pico que se programo para leer los bits sin procesar del TPM. Asi, se consiguen descubrir las claves de cifrado y claves maestras en un corto lapso de unos segundos.

Esta [[Vulnerabilidad]] se encuentra solo en algunos dispositivos Lenovo antiguos.

(Breaking Bitlocker: https://youtu.be/wTl4vEednkQ)
