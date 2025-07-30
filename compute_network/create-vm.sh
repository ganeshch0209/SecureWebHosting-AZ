#!/bin/bash

# Create Resource Group
az group create \
  --name rg-infra-lab \
  --location eastus

# Create Virtual Network and Subnet
az network vnet create \
  --resource-group rg-infra-lab \
  --name vnet-lab \
  --address-prefix 10.0.0.0/16 \
  --subnet-name subnet-web \
  --subnet-prefix 10.0.1.0/24

# Create Network Security Group
az network nsg create \
  --resource-group rg-infra-lab \
  --name nsg-web

# Create NSG Rule for SSH
az network nsg rule create \
  --resource-group rg-infra-lab \
  --nsg-name nsg-web \
  --name allow-ssh \
  --protocol tcp \
  --direction inbound \
  --priority 1000 \
  --source-address-prefixes '*' \
  --source-port-ranges '*' \
  --destination-port-ranges 22 \
  --access allow

# Create Public IP
az network public-ip create \
  --resource-group rg-infra-lab \
  --name pip-web

# Create NIC and Attach NSG
az network nic create \
  --resource-group rg-infra-lab \
  --name nic-web \
  --vnet-name vnet-lab \
  --subnet subnet-web \
  --network-security-group nsg-web \
  --public-ip-address pip-web

# Create Ubuntu VM
az vm create \
  --resource-group rg-infra-lab \
  --name vm-web \
  --nics nic-web \
  --image UbuntuLTS \
  --admin-username azureuser \
  --generate-ssh-keys

# Output Public IP
az vm show \
  --resource-group rg-infra-lab \
  --name vm-web \
  --show-details \
  --query publicIps \
  --output tsv

# Optional Cleanup
# az group delete --name rg-infra-lab --yes --no-wait
