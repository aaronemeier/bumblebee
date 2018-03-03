# Bumblebee
My setup

## Preparation
Below is a list with things, that are not yet automized and need to be done manually.

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

## Setup
```bash
git clone https://gitlab.com/cynja/bumblebee.git ~/.setup
```

## Deploy
```bash
(cd ~/.setup && sh run.sh)
```
