#Python Programación Python
Proveniente de [[Índice - Python]]

---
``` python
import sys
import os
import logging
import platform

appName = "ScriptOS"

def obtenerDirectorioLogs():
	if sys.platform == "win32":
		baseDir = os.environ.get("LOCALAPPDATA", os.path.expanduser("~"))
		return os.path.join(baseDir, appName, "Logs")
	elif sys.platform == "darwin":
		return os.path.expanduser(f"~/Library/Logs/{appName}")
	elif sys.platform == "linux":
		baseDir = os.environ.get("XDG_STATE_HOME", os.path.expanduser("~/.local/state"))
		return os.path.join(baseDir, appName, "log")
		
	else:
		return os.path.expanduser(f"~/.{appName}/logs")

def configLogger():
	logDir = obtenerDirectorioLogs()
	
	os.makedirs(logDir, exist_ok=True)

	logFile = os.path.join(logDir, "app.log")

	logging.basicConfig(filename=logFile, level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s", datefmt="%Y-%m-%d %H:%M:%S")
	console = logging.StreamHandler(sys.stdout)
	console.setLevel(logging.INFO)
	logging.getLogger('').addHandler(console)
	
	return logFile
def main():
	rutaLog = configLogger()
	logging.info(f"--- Iniciando script. Logs guardados en: {rutaLog} ---")
	if sys.platform == "win32":
		logging.info("Sistema detectado: Windows.")
		versionWindows = platform.version()
		logging.info(f"Ejecutando rutina de Windows. Versión del kernel: {versionWindows}")
	elif sys.platform == "darwin":
		logging.info("Sistema detectado: macOS.")
		versionMac = platform.version()
		logging.info(f"Ejecutando rutina de macOS. Versión del kernel {versionMac}")
	elif sys.platform.startswith("linux"):
		logging.info("Sistema detectado: Linux")	
		try:
			with open("/etc/os-release", "r") as f:
				primeraLinea = f.readline().strip()
				logging.info(f"Ejecutando rutina de Linux. Info de la distro: {primeraLinea}")
		except FileNotFoundError:
			logging.warning("No se pudo leer /etc/os-release.")
	else:
		logging.warning(f"Sistema Operativo no contemplado o desconocido: {sys.platform}")
		
	logging.info("Script finalizado correctamente. \n")
	
if __name__ == "__main__":
	main()
```

>[!Output (en mi caso: Linux):]
>--- Iniciando script. Logs guardados en: /home/carpi/.local/state/ScriptOS/log/app.log ---
Sistema detectado: Linux
Ejecutando rutina de Linux. Info de la distro: NAME="Arch Linux"
Script finalizado correctamente. 

>[!Output del log]
>$ cat ~/.local/state/ScriptOS/log/app.log 
2026-03-12 17:15:47 - INFO - --- Iniciando script. Logs guardados en: /home/carpi/.local/state/ScriptOS/log/app.log ---
2026-03-12 17:15:47 - INFO - Sistema detectado: Linux
2026-03-12 17:15:47 - INFO - Ejecutando rutina de Linux. Info de la distro: NAME="Arch Linux"
2026-03-12 17:15:47 - INFO - Script finalizado correctamente. 
