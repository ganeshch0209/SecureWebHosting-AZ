#!/bin/bash

# Variables
location="eastus"
rg="az104-lab-rg"
vnet="az104-vnet"
subnet="az104-subnet"
nsg="az104-nsg"
nic="az104-nic"
vm="az104-vm"
ip="az104-ip"
user="azureuser"
image="ubuntu-24_04-lts"

# Create resource group
az group create --name $rg --location $location

# Create VNet and Subnet
az network vnet create --resource-group $rg --name $vnet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name $subnet --subnet-prefix 10.0.1.0/24

# Create NSG with SSH rule
az network nsg create --resource-group $rg --name $nsg
az network nsg rule create --resource-group $rg --nsg-name $nsg \
  --name Allow-SSH --priority 1000 --protocol Tcp \
  --direction Inbound --source-address-prefixes '*' \
  --source-port-ranges '*' --destination-port-ranges 22 \
  --access Allow

# Create public IP
az network public-ip create --resource-group $rg --name $ip

# Create NIC
az network nic create --resource-group $rg --name $nic \
  --vnet-name $vnet --subnet $subnet \
  --network-security-group $nsg \
  --public-ip-address $ip

# Create VM
az vm create --resource-group $rg --name $vm \
  --image $image --admin-username $user \
  --generate-ssh-keys --nics $nic

# Output IP
az vm list-ip-addresses --resource-group $rg --name $vm --output table
