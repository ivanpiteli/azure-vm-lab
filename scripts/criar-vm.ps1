# Script para criar uma VM no Azure via PowerShell

# Login no Azure
Connect-AzAccount

# Criar grupo de recursos
New-AzResourceGroup -Name "LabGrupo-01" -Location "BrazilSouth"

# Criar VM Windows
New-AzVM `
  -ResourceGroupName "LabGrupo-01" `
  -Name "LabVM-01" `
  -Location "BrazilSouth" `
  -VirtualNetworkName "LabVnet-01" `
  -SubnetName "LabSubnet-01" `
  -SecurityGroupName "LabNSG-01" `
  -PublicIpAddressName "LabIP-01"
