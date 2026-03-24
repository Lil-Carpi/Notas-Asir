#Organizar

---
![[nfsWindowsClientInstallation.png]]![[nfsWindowsClientInstallationActivation.png]]
![[nfsWindowsClientInstallationSearch.png]]

Instalar la caracteristica mediante powershell (admin):
- Desde Cliente Windows
``` powershell
Enable-WindowsOptionalFeature -Online -FeatureName ClientForNFS-Infrastructure, NFS-Administration
```
- Desde Server Windows
```PowerShell
Install-WindowsFeature -Name NFS-Client
```

Montar una carpeta compartida en windows por la shell
```shell
mount -o anon IP_SERVIDOR:/ruta/compartida X:
```
>[!attention]
>Para ponerle una letra en especifico, se ha de cambiar la `X` por la letra deseada. Si quieres poner una letra aleatoria, ponga `*`
