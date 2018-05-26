# Bumblebee
[![Build Status](https://travis-ci.org/cynja/bumblebee.svg?branch=master)](https://travis-ci.org/cynja/bumblebee)

This is just a small ansible role to reflect my setup.  
It has been simplified to only store settings, that are hidden by default or would need too much time if done manually.

## Preparation
Below is a list with things, that need to be done in advance.
- Login to Mac App Store
- Optional: Setup a Windows VM
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
