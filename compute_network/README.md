# Phase 1: Compute and Networking Setup

This phase sets up the foundational compute and networking environment required for advanced Azure infrastructure management. It maps to multiple AZ-104 domains including virtual machines, networking, NSGs, and IP addressing.

---

## 🎯 Objectives

- Deploy an Ubuntu virtual machine (VM)
- Configure a virtual network (VNet) and subnet
- Create and associate a Network Security Group (NSG)
- Attach a public IP address
- Secure the VM with SSH access

---

## 📁 Files

| File           | Purpose                                  |
|----------------|------------------------------------------|
| `create-vm.sh` | Bash script to create the full setup     |
| `purge-env.sh` | Script to delete all related resources   |

---

## 🧱 What It Creates

- **Resource Group**: `az104-lab-rg`
- **VNet/Subnet**: 10.0.0.0/16 with a 10.0.1.0/24 subnet
- **NSG**: Allows inbound SSH traffic
- **NIC**: Bound to NSG, VNet, and Public IP
- **VM**: Ubuntu LTS image with SSH access

---

## 🚀 How to Use

### Run the Setup:
```bash
chmod +x create-vm.sh
./create-vm.sh
```

### Sample Output:
```
Public IP address: 20.123.45.67
VM created: az104-vm
```

Use this IP to SSH into your VM:
```bash
ssh azureuser@20.123.45.67
```

---

## 🧹 Cleanup (Optional)
If you'd like to remove everything:
```bash
chmod +x purge-env.sh
./purge-env.sh
```

### purge-env.sh
```bash
#!/bin/bash

# Variables
RESOURCE_GROUP="az104-lab-rg"

echo "⚠️  This will delete the entire resource group: $RESOURCE_GROUP"
read -p "Type 'YES' to continue: " CONFIRM

if [ "$CONFIRM" == "YES" ]; then
  echo "🧹 Deleting resource group: $RESOURCE_GROUP ..."
  az group delete --name $RESOURCE_GROUP --yes --no-wait
  echo "✅ Deletion initiated. Check Azure Portal for progress."
else
  echo "❌ Aborted. No resources were deleted."
fi
```

---

## 📁 Logs Folder (Optional)
Create a `log/` folder to store:

- Shell output logs
- Deployment outputs
- Screenshot links (optional)

Example usage in Cloud Shell:
```bash
mkdir -p log
./create-vm.sh | tee log/setup_output.txt
```

---

## 📘 Related AZ-104 Domains

| Domain                            | Task                                     |
|----------------------------------|------------------------------------------|
| Configure VMs                     | VM deployment, NIC binding               |
| Configure virtual networks        | VNet, Subnet, NSG, IPs                   |
| Implement and manage networking  | NSG rules, subnet addressing             |
| Monitor and manage compute       | Resource group-based VM administration   |

---

## 🔚 Next Step
After validating connectivity, move to Phase 2 where you'll deploy App Services, logging, and monitoring.
