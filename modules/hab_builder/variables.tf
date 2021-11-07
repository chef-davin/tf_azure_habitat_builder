variable "architecture_prefix" {
  description = "prefix for named pieces of the architecture"
  type        = string
}

variable "location" {
  description = "Azure Region to Put Things"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name to use"
  type        = string
}

variable "nsg_ssh_source_address_prefixes" {
  description = "Source address for SSH connectivity to the built machines"
  type        = list(string)
}

variable "x_contact_tag" {
  description = "Email address of contact for the owner of the resource"
  type        = string
}

variable "x_dept_tag" {
  description = "Department that the X-Contact belongs to"
  type        = string
}

variable "provisioner_exec_data_hab" {
  description = "Lines to sent to remote-exec provisioner"
  type        = list(string)
  default     = ["echo 'nothing to do'"]
}

variable "ssh_username" {
  description = "Username to be used when creating the admin user on the hab_builder linux server"
  type        = string
  default     = ""  
}

variable "ssh_key_file_location" {
  description = "Path to AWS key PEM file on local filesystem"
  type        = string
  default     = ""
}

variable "ssh_pub_file_location" {
  description = "Path to AWS key PEM file on local filesystem"
  type        = string
  default     = ""
}

variable "letsencrypt_email" {
  description = "Email address to use for registering letsencrypt SSL certificate"
  type        = string
  default     = ""
}

variable "oauth_client_id" {
  description = "Github OAUTH Client ID"
  type        = string
  default     = ""
}

variable "oauth_client_secret" {
  description = "Github OAUTH Client Secret"
  type        = string
  default     = ""
}

variable "builder_source_image_publisher" {
  description = "Publisher for the Source Image to build the VM with"
  type        = string
  default     = "almalinux"
}

variable "builder_source_image_offer" {
  description = "Offer for the Source Image to build the VM with"
  type        = string
  default     = "almalinux"
}

variable "builder_source_image_sku" {
  description = "SKU for the Source Image to build the VM with"
  type        = string
  default     = "8_4-gen2"
}

variable "builder_source_image_version" {
  description = "Version of the Source Image to build the VM with"
  type        = string
  default     = "8.4.20210729"
}

variable "builder_plan_name" {
  description = "Plan Name for the Source Image"
  type        = string
  default     = "8_4-gen2"
}

variable "builder_plan_product" {
  description = "Plan Product for the Source Image"
  type        = string
  default     = "almalinux"
}

variable "builder_plan_publisher" {
  description = "Plan Publisher for the Source Image"
  type        = string
  default     = "almalinux"
}

variable "github_username" {
  description = "The username of your github account"
  type        = string
  default     = ""
}

variable "github_email" {
  description = "The email of your github account"
  type        = string
  default     = ""
}

variable "restore_database" {
  description = ""
  type = bool
  default = true
}

variable "pull_core_x86_64_linux" {
  description = ""
  type = bool
  default = true
}

variable "pull_core_x86_64_windows" {
  description = ""
  type = bool
  default = true
}

variable "pull_effortless_x86_64_linux" {
  description = ""
  type = bool
  default = true
}

variable "pull_effortless_x86_64_windows" {
  description = ""
  type = bool
  default = true
}

variable "pull_builder_x86_64_linux" {
  description = ""
  type = bool
  default = true
}

variable "load_packages_to_builder" {
  description = ""
  type = bool
  default = true
}
