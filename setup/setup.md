# 🛠️ Terraform Installation Guide for DevOps

Terraform is an open-source tool by HashiCorp used to define and provide data center infrastructure using a high-level configuration language (HCL).

---

## 🐧 1. Linux (Ubuntu/Debian)

The most common way to install Terraform on Linux is via the official HashiCorp repository.

### Step 1: Update and install dependencies

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

### Step 2: Add the HashiCorp GPG key

```bash
curl -fsSL [https://apt.releases.hashicorp.com/gpg](https://apt.releases.hashicorp.com/gpg) | sudo apt-key add -
```

### Step 3: Add the official repository

```bash
sudo apt-add-repository "deb [arch=amd64] [https://apt.releases.hashicorp.com](https://apt.releases.hashicorp.com) $(lsb_release -cs) main"
```

### Step 4: Install Terraform

```bash
sudo apt-get update && sudo apt-get install terraform
```

---

# 🍎 2. macOS

Step 1: Install the HashiCorp tap

```bash
brew tap hashicorp/tap
```

## Step 2: Install Terraform

```bash
brew install hashicorp/tap/terraform

# Note: If you already have it installed and want to update, use: brew upgrade hashicorp/tap/terraform
```

## 3. Windows

For Windows users, using Chocolatey or Scoop is recommended for easy version management.

Via Chocolatey

```PowerShell
choco install terraform
```

Scoop

```powershell
scoop install terraform
```

---

# ✅ 4. Verify the Installation

```bash
terraform -help

terraform version
```
