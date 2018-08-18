variable "project_name" {
  default     = "default-project"
  description = "Project ID"
}

variable "region" {
  default     = "southamerica-east1"
  description = "Region name"
}

variable "zone" {
  default     = "a"
  description = "Region Zone"
}

variable "credentials_file" {
  default     = "account.json"
  description = "Compute Engine API credentials JSON file"
}

variable "machine_type" {
  default     = "f1-micro"
  description = "Machine type"
}

variable "disk_image" {
  default     = "centos-cloud/centos-7"
  description = "Disk image"
}

variable "ssh_key" {
  default     = "keys/admin_key"
  description = "SSH key"
}

variable "ssh_username" {
  default     = "root"
  description = "The SSH username to use"
}

variable "webserver_servers" {
  default     = "3"
  description = "Amount of web servers"
}

variable "db_type" {
  default     = "db-f1-micro"
  description = "Google SQL DB type"
}

variable "db_authorized_network" {
  default     = "0.0.0.0/0"
  description = "A corporate network authorized to access the DB"
}

variable "db_username" {
  default     = "dbadmin"
  description = "A MySQL username"
}

variable "db_password" {
  default     = "changeme"
  description = "A MySQL password"
}

variable "db_name_master" {
  default     = "db_name"
  description = "MySQL database master name"
}

variable "db_name_slave" {
  default     = "db_name"
  description = "MySQL database slave name"
}
