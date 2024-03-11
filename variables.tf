variable "proxmox_host" {
    default = "dragonfruit"
}

variable "pub_key" {
    default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFWBSqU96tkC6BfobUs6zZHnO3mqGUjrktU+MUDoc3/h dylan@shepard.dev"
}

variable "k3s_token" {
    sensitive = true
}

variable "k3s_url" {
    default = "k8s2.lab"
}

variable "k3s_channel" {
    default = "latest"
}

variable "vip" {
    default = "10.3.0.1"
}

variable "proxmox_username" {
    default = "root@pam"
}

variable "proxmox_password" {}

variable "proxmox_ip" {
    default = "10.0.0.254"
}

variable "workers" {
    type = map
}

variable "controllers" {
    type = map
}
