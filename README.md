# Secure Azure Infrastructure for Web Hosting
Deploy a real-world Azure environment with VMs, App Services, Storage, Monitoring, Backup, RBAC, and Security controls. This mimics an Azure Admin's responsibilities in a corporate environment.

# Azure Infrastructure Lab – Initial Setup (Compute + Network + Identity)

This section lays the foundation for a real-world Azure environment by provisioning basic infrastructure services using the Azure CLI. It demonstrates the creation of a Virtual Machine in a secure network, connected through NSG rules, and access-controlled via RBAC roles.

---

## ✅ Objectives

- Provision core infrastructure components (VM, VNet, Subnet, NSG, Public IP)
- Secure access to VM using Network Security Group (NSG)
- Implement Role-Based Access Control (RBAC) at the Resource Group level
- Practice core Azure CLI commands aligned with AZ-104 learning goals

---

## 📁 Folder Structure

01_compute_network/
├── create-vm.sh # Script to provision VM with networking
├── configure-nsg.sh # Script to create NSG and SSH rule
└── setup-rbac.md # Role assignment for Reader access

yaml
Copy
Edit

---

## 🔧 What’s Implemented

| Feature                 | Description |
|------------------------|-------------|
| **Resource Group**     | Container for all lab resources (`rg-infra-lab`) |
| **Virtual Network**    | Created with subnet for web tier |
| **Public IP**          | Static public IP for SSH access |
| **NSG**                | Allows only port 22 (SSH) |
| **VM (Ubuntu LTS)**    | Lightweight VM deployed with auto-generated SSH keys |
| **NIC with NSG + IP**  | Network Interface Card connected to VNet and secured with NSG |
| **RBAC**               | Reader role assigned to a test user for practice |

---

## 🔐 Security Notes

- Only port **22** is open for remote access via NSG.
- SSH keys are generated automatically and stored in `~/.ssh` for current user.
- No public storage buckets or open web ports are exposed.

---

## 📊 AZ-104 Concepts Practiced

- Create and manage Azure Resource Groups
- Deploy and configure virtual machines
- Configure Virtual Network, Subnet, and NSG rules
- Assign RBAC roles using Azure CLI
- Retrieve activity logs for auditing access

---

## 🧠 Useful Azure CLI Commands

```bash
az group create ...
az network vnet create ...
az network nsg rule create ...
az vm create ...
az role assignment create ...
az monitor activity-log list ...
