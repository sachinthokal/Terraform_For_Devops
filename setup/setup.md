# 🛠️ Terraform Installation Guide for DevOps

Terraform is an open-source tool by HashiCorp used to define and provide data center infrastructure using a high-level configuration language (HCL).

---

## 1. Linux (Ubuntu/Debian)

The most common way to install Terraform on Linux is via the official HashiCorp repository.

#### Step 1: Update and install dependencies

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

#### Step 2: Install HashiCorp's GPG key

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

```

#### Step 3: Verify the GPG key's fingerprint

```bash
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

```

### Step 4: Add the official HashiCorp repository to your system

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

```

### Step 5: Install Terraform

```bash
sudo apt-get update && sudo apt-get install terraform
```

---

# 2. MacOS

#### Step 1: Install the HashiCorp tap

```bash
brew tap hashicorp/tap
```

#### Step 2: Install Terraform

```bash
brew install hashicorp/tap/terraform

# Note: If you already have it installed and want to update, use: brew upgrade hashicorp/tap/terraform
```

---

# 3. Windows

For Windows users, using Chocolatey or Scoop is recommended for easy version management.

#### Via Chocolatey

```PowerShell
choco install terraform
```

#### Scoop

```PowerShell
scoop install terraform
```

---

# ✅ 4. Verify the Installation

```bash
terraform -help

terraform version
```
---