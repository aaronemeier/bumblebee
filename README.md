# Bumblebee
[![Build Status](https://travis-ci.com/cynja/bumblebee.svg?token=qsq6ipkGdWY8noRaZ81h&branch=master)](https://travis-ci.com/cynja/bumblebee)

My setup

## Preparation
Below is a list with things, that have not been automatized yet and need to be done manually.

- Login to App Store (for App Store install)
- Save the ansible-vault password in mac OS Keychain
```bash
security add-generic-password \
  -a cynja \
  -s ansible-vault-password \
  -w "secret_password"
```
- Create a codesigning certificate for chunkwm/khd
  - Open **Keychain.app**
  - Select `Keychain Access`
  - Select `Certificate assistant`
  - Select `Create a certificate`
    - Name: `chunkwm-khd-cert`
    - Identity type: `Self Signed Root`
    - Certificate type: `Code Signing`
- Secure boot process by creating an efi firmware password prevent unattended access
  - Reboot into recovery by pressing `Cmd+R`
  - Choose `Utilities` > `Firmware Password Utility`
  - Select `Turn On Firmware Password`
  - Restart
- Setup filevault (disk encryption)
  - Just open `System preferences`, select `Security & Privacy`and `Turn On FileVault`
- Setup Windows VM 
  - Create new Windows 10 VM in Parallels
  - Set network adapter to shared (NAT)
  - Enable remote access via winrm
```powershell
# Download latest setup script
Invoke-WebRequest https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile $env:temp/ConfigureRemotingForAnsible.ps1

# Enable remote access via winrm
powershell.exe  -ExecutionPolicy Bypass -File $env:temp/ConfigureRemotingForAnsible.ps1 -CertValidityDays 3650 -Verbose -SkipNetworkProfileCheck
```

## Setup
```bash
git clone https://github.com/cynja/bumblebee.git ~/.setup
```

## Deploy
```bash
(cd ~/.setup && sh run.sh)
```