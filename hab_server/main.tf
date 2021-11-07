module "hab_builder" {
  # Module Source
  source                          = "../modules/hab_builder/"

  # Azure Architecture Variables
  architecture_prefix             = "my" # will prefix the name of all your azure infrastructure
  location                        = "Central US" # azure region to build your infrastructure in
  nsg_ssh_source_address_prefixes = ["1.1.1.1"] # IP addresses and CIDR blocks to all ssh access from
  resource_group_name             = "" # resource group to build in - module does not create the resource group
  x_contact_tag                   = "" # Your company contact info for tagging your infrastructure
  x_dept_tag                      = "" # Your company department for tagging your infrastructure
  ssh_username                    = "" # The username used to connect to the virtual machine
  ssh_key_file_location           = "/Users/<username>/.ssh/id_rsa" # Path to private RSA ssh key
  ssh_pub_file_location           = "/Users/<username>/.ssh/id_rsa.pub" # Path to public RSA ssh key
  letsencrypt_email               = "" # email for registering LetsEncrypt SSL certificate
  
  # VM Image Information
  builder_source_image_offer      = "almalinux"
  builder_source_image_publisher  = "almalinux"
  builder_source_image_sku        = "8_4-gen2"
  builder_source_image_version    = "8.4.20210729"
  builder_plan_name               = "8_4-gen2"
  builder_plan_product            = "almalinux"
  builder_plan_publisher          = "almalinux"

  # Builder Config Variables - Uses Github for OAuth
  # When creating your GitHub application, the return URL will be:
  #  https://<architecture_prefix>-bldr.<azure_region>.cloudapp.azure.com
  oauth_client_id                 = "" # GitHub Application Client ID
  oauth_client_secret             = "" # GitHub Application Client Secret

  # Database Restore Variables
  restore_database                = true
  github_username                 = "" # username of your github account for when you login to builder the first time
  github_email                    = "" # email address of your github account for when you login to builder for the first time

  # Package Download Variables
  # If set to true, packages will be downloaded from the seed list of the same name
  pull_core_x86_64_linux          = true
  pull_core_x86_64_windows        = true
  pull_effortless_x86_64_linux    = true
  pull_effortless_x86_64_windows  = true
  pull_builder_x86_64_linux       = true

  # Package Load Variables
  # If set to true, packages will be pushed to your new on-prem builder server
  load_packages_to_builder        = true
}

output "bldr_pub_ip" {
  description = "Public IP address assigned to the A2 instance"
  value       = module.hab_builder.bldr_server_pub_ip
}

output "bldr_pub_ip_fqdn" {
  description = "Public IP address assigned to the A2 instance"
  value       = module.hab_builder.bldr_server_pubip_fqdn
}
