terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.6"
    }
  }
  required_version = ">= 1.0.5"
}

provider "proxmox" {
  pm_api_url = "https://192.168.86.45:8006/api2/json"
  pm_api_token_id = "terraform@pam!terraform"
  pm_api_token_secret = "c567bfa3-6c85-4deb-8848-ea38e4e44440"
  pm_tls_insecure = "true"
  pm_log_enable = true
  pm_log_file = "terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default = "debug"
    _capturelog = ""
  }
}