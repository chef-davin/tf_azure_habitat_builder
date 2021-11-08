resource "null_resource" "restore_database" {
  depends_on = [
    null_resource.configure_bldr,
  ]
  count = var.restore_database ? 1 : 0

  provisioner "file" {
    source      = "${path.module}/data/load-builder.sql"
    destination = "/tmp/load-builder.sql"
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }

  provisioner "file" {
    source      = "${path.module}/scripts/restore-database.sh"
    destination = "/tmp/restore-database.sh"
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/restore-database.sh",
      "sudo /tmp/restore-database.sh -u ${azurerm_public_ip.builder_public_ip.fqdn} -g ${var.github_username} -e ${var.github_email}"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}

resource "null_resource" "pull_core_x86_64_linux" {
  depends_on = [
    null_resource.configure_bldr
  ]
  count = var.pull_core_x86_64_linux ? 1 : 0

  provisioner "remote-exec" {
    inline = [
      "sudo hab pkg download --target x86_64-linux --channel stable --file /tmp/on-prem-builder/package_seed_lists/core_full_x86_64-linux_stable --download-directory /hab/builder_bootstrap"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}

resource "null_resource" "pull_core_x86_64_windows" {
  depends_on = [
    null_resource.configure_bldr
  ]
  count = var.pull_core_x86_64_windows ? 1 : 0

  provisioner "remote-exec" {
    inline = [
      "sudo hab pkg download --target x86_64-windows --channel stable --file /tmp/on-prem-builder/package_seed_lists/core_full_x86_64-windows_stable --download-directory /hab/builder_bootstrap"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}

resource "null_resource" "pull_effortless_x86_64_linux" {
  depends_on = [
    null_resource.configure_bldr
  ]
  count = var.pull_effortless_x86_64_linux ? 1 : 0

  provisioner "remote-exec" {
    inline = [
      "sudo hab pkg download --target x86_64-linux --channel stable --file /tmp/on-prem-builder/package_seed_lists/effortless_x86_64-linux_stable --download-directory /hab/builder_bootstrap"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}

resource "null_resource" "pull_effortless_x86_64_windows" {
  depends_on = [
    null_resource.configure_bldr
  ]
  count = var.pull_effortless_x86_64_windows ? 1 : 0

  provisioner "remote-exec" {
    inline = [
      "sudo hab pkg download --target x86_64-windows --channel stable --file /tmp/on-prem-builder/package_seed_lists/effortless_x86_64-windows_stable --download-directory /hab/builder_bootstrap"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}

resource "null_resource" "pull_builder_x86_64_linux" {
  depends_on = [
    null_resource.configure_bldr
  ]
  count = var.pull_builder_x86_64_linux ? 1 : 0

  provisioner "remote-exec" {
    inline = [
      "sudo hab pkg download --target x86_64-linux --channel stable --file /tmp/on-prem-builder/package_seed_lists/builder_x86_64-linux_stable --download-directory /hab/builder_bootstrap"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}

resource "null_resource" "load_packages_to_builder" {
  depends_on = [
    null_resource.restore_database,
    null_resource.pull_core_x86_64_linux,
    null_resource.pull_core_x86_64_windows,
    null_resource.pull_effortless_x86_64_linux,
    null_resource.pull_effortless_x86_64_windows,
    null_resource.pull_builder_x86_64_linux,
  ]
  count = var.load_packages_to_builder ? 1 : 0

  provisioner "file" {
    source      = "${path.module}/scripts/upload-packages.sh"
    destination = "/tmp/upload-packages.sh"
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/upload-packages.sh",
      "sudo /tmp/upload-packages.sh -u ${azurerm_public_ip.builder_public_ip.fqdn}"
    ]
    connection {
      host        = azurerm_linux_virtual_machine.builder_server.public_ip_address
      type        = "ssh"
      user        = var.ssh_username
      private_key = file(var.ssh_key_file_location)
    }
  }
}
