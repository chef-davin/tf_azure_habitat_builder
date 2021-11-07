# Terraform Azure Habitat Builder Module

This repository contains a hab_builder Terraform module to deploy a Chef Habitat Builder server into an Azure resource group.  There is a hab_server directory with a [main.tf](https://github.com/chef-davin/tf_azure_habitat_builder/blob/main/hab_server/main.tf) template to allow you to configure how the module is utilized.

-----

## Some Specifics

This module takes the following steps to give you a fulll on-prem builder test server environment

1. Builds the infrastructure required to host a hab bldr server
    - Networking setup for a vm, (nic, public IP, NSG, etc)
    - VM with two disks (a secondary one for the /hab partition)
2. Ensures that SELinux is disabled on the system
3. Configures the second disk and mounts it to the /hab partition
4. Gets LetsEncrypt SSL certs to setup builder with SSL instead of using port 80
5. Configures and Installs Habitat Builder services using the [on-prem-builder repo](https://github.com/habitat-sh/on-prem-builder)
6. Optionally loads a database backup linking your github account to the builder and creating some basic origins and a private auth to linked to that account
7. Optionally downloads packages from seed lists provided by the on-prem-builder repo
8. Optionally pushes those packages up to the newly created on-prem builder using the private auth token from the database restore
