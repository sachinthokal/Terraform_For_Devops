# 1. Resource Group
resource "azurerm_resource_group" "terraform-rg" {
  name     = var.resource_group_name
  location = var.location
}

# 2. Virtual Network
resource "azurerm_virtual_network" "terraform-vnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraform-rg.location
  resource_group_name = azurerm_resource_group.terraform-rg.name
}

# 3. Subnet
resource "azurerm_subnet" "terraform-subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.terraform-rg.name
  virtual_network_name = azurerm_virtual_network.terraform-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# 4. Public IP Address
resource "azurerm_public_ip" "terraform-pip" {
  name                = "terraform-pip"
  location            = azurerm_resource_group.terraform-rg.location
  resource_group_name = azurerm_resource_group.terraform-rg.name
  sku                 = "Standard"    # Standard SKU is required for static IPs in Azure. Basic SKU does not support static allocation.
  allocation_method   = "Static"      # Standard 
}

# 5. Network Security Group (SSH Open)
resource "azurerm_network_security_group" "terraform-nsg" {
  name                = "terraform-nsg"
  location            = azurerm_resource_group.terraform-rg.location
  resource_group_name = azurerm_resource_group.terraform-rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

# 6. Network Interface (NIC) - Link between VM and VNet, Subnet, Public IP
resource "azurerm_network_interface" "terraform-nic" {
  name                = "terraform-nic"
  location            = azurerm_resource_group.terraform-rg.location
  resource_group_name = azurerm_resource_group.terraform-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terraform-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform-pip.id # Fix: Link Public IP
  }
}

# 7. Associate NSG with NIC
resource "azurerm_network_interface_security_group_association" "nic-nsg-assoc" {
  network_interface_id      = azurerm_network_interface.terraform-nic.id
  network_security_group_id = azurerm_network_security_group.terraform-nsg.id
}

# 8. Virtual Machine
resource "azurerm_linux_virtual_machine" "terraform-vm" {
  name                = var.virtual_machine_name
  resource_group_name = azurerm_resource_group.terraform-rg.name
  location            = azurerm_resource_group.terraform-rg.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.terraform-nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher_name
    offer     = var.publisher_offer
    sku       = var.publisher_sku
    version   = var.publisher_version
  }
}