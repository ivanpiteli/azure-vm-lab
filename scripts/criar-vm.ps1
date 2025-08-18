# Script para criar uma VM no Azure via PowerShell

# Login no Azure
Connect-AzAccount

# Criar grupo de recursos
New-AzResourceGroup -Name "LabGrupo" -Location "BrazilSouth"

# Criar VM Windows
New-AzVM `
  -ResourceGroupName "LabGrupo" `
  -Name "LabVMWin" `
  -Location "BrazilSouth" `
  -VirtualNetworkName "LabVnet" `
  -SubnetName "LabSubnet" `
  -SecurityGroupName "LabNSG" `
  -PublicIpAddressName "LabIP"
