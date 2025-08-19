#!/bin/bash
# Script para criar uma VM no Azure via CLI

# Login no Azure
az login

# Criar grupo de recursos
az group create --name LabGrupo-01 --location brazilsouth

# Criar VM Ubuntu
az vm create   --resource-group LabGrupo-01  --name LabVM-01   --image UbuntuLTS   --admin-username azureuser   --generate-ssh-keys
