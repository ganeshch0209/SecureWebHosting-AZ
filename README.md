# Azure Infrastructure Lab for AZ-104 Practical Learning

This project is a hands-on Azure infrastructure lab aligned with the [AZ-104: Microsoft Azure Administrator](https://learn.microsoft.com/en-us/certifications/azure-administrator/) certification objectives. It is built progressively to simulate real-world infrastructure deployment using Azure CLI, PowerShell, and Bicep where relevant.

The goal is to solidify your understanding of Azure core services, networking, identity, governance, monitoring, and backup — all within your free credit or pay-as-you-go subscription.

---

## 🔧 Technologies Used
- Azure CLI
- PowerShell (optional)
- Azure Resource Manager
- Azure Portal
- Git for version control

---

## 📦 Project Structure

```bash
azure-infra-lab/
├── 01_compute_network/            # VM, VNet, NSG, Public IP
├── 02_app_service_monitoring/     # Web App, Log Analytics, Diagnostics
├── 03_backup_identity/            # Recovery Vault, RBAC, Key Vault
├── global-resources/              # Shared tagging, cleanup scripts
└── README.md                      # Project overview (this file)
```

Each folder has:
- A `README.md` explaining its purpose
- Scripts (`.sh`, `.json`, `.bicep`) to deploy resources

---

## 🧭 Learning Objectives

✅ Understand how to:
- Create and manage compute resources (VMs, scale sets)
- Configure networking with NSGs, VNets, and subnets
- Apply and manage role-based access control (RBAC)
- Implement monitoring and diagnostics
- Automate backups and disaster recovery
- Secure secrets with Azure Key Vault

---

## 🚀 Getting Started

1. Fork this repo to your GitHub account
2. Open [Azure Cloud Shell](https://shell.azure.com/)
3. Clone your fork and follow each phase step-by-step
4. Track changes using Git with clear commits

```bash
git clone https://github.com/your-username/azure-infra-lab.git
cd azure-infra-lab
```

---

## 📘 AZ-104 Topic Mapping (in progress)

| Module | Area | Folder |
|--------|------|--------|
| Deploy & manage compute | VM, VMSS | `01_compute_network/` |
| Configure & manage virtual networks | VNet, NSG | `01_compute_network/` |
| Monitor & backup Azure resources | Log Analytics, Backup Vault | `02_app_service_monitoring/`, `03_backup_identity/` |
| Implement & manage storage | Storage Account, Key Vault | `03_backup_identity/` |
| Manage Azure identities & governance | RBAC, Tags, Policies | `03_backup_identity/`, `global-resources/` |

---

---

## 🤝 Contributing
This is a personal learning project. Forks welcome!
