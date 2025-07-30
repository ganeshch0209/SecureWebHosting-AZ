#!/bin/bash

# Variables
RESOURCE_GROUP="demo-lab-rg"
LOCATION="southindia"
VNET_NAME="demo-vnet"
SUBNET_NAME="demo-subnet"
NSG_NAME="demo-nsg"
NIC_NAME="demo-nic"
PUBLIC_IP_NAME="demo-public-ip"
VM_NAME="demo-vm"
USERNAME="azureuser"

# Create Resource Group
echo "🛠️ Creating Resource Group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create VNet and Subnet
echo "🌐 Creating Virtual Network and Subnet..."
az network vnet create \
  --resource-group $RESOURCE_GROUP \
  --name $VNET_NAME \
  --address-prefix 10.0.0.0/16 \
  --subnet-name $SUBNET_NAME \
  --subnet-prefix 10.0.1.0/24

# Create NSG and allow SSH
echo "🔐 Creating Network Security Group and SSH rule..."
az network nsg create \
  --resource-group $RESOURCE_GROUP \
  --name $NSG_NAME

az network nsg rule create \
  --resource-group $RESOURCE_GROUP \
  --nsg-name $NSG_NAME \
  --name Allow-SSH \
  --protocol Tcp \
  --direction Inbound \
  --priority 1000 \
  --source-address-prefixes '*' \
  --source-port-ranges '*' \
  --destination-address-prefixes '*' \
  --destination-port-ranges 22 \
  --access Allow

# Create Public IP
echo "🌍 Creating Public IP..."
az network public-ip create \
  --resource-group $RESOURCE_GROUP \
  --name $PUBLIC_IP_NAME \
  --allocation-method Dynamic

# Create NIC
echo "🔧 Creating Network Interface..."
az network nic create \
  --resource-group $RESOURCE_GROUP \
  --name $NIC_NAME \
  --vnet-name $VNET_NAME \
  --subnet $SUBNET_NAME \
  --network-security-group $NSG_NAME \
  --public-ip-address $PUBLIC_IP_NAME

# Create VM
echo "💻 Creating Ubuntu VM..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --nics $NIC_NAME \
  --image UbuntuLTS \
  --admin-username $USERNAME \
  --generate-ssh-keys \
  --size Standard_B1s \
  --location $LOCATION

# Get Public IP
IP=$(az vm list-ip-addresses --resource-group $RESOURCE_GROUP --name $VM_NAME --query "[].virtualMachine.network.publicIpAddresses[].ipAddress" -o tsv)

echo "✅ VM Created Successfully!"
echo "🔗 SSH using: ssh $USERNAME@$IP"
