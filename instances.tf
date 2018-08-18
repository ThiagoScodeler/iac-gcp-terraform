resource "google_compute_instance" "webserver" {
  count        = "${var.webserver_servers}"
  name         = "webserver-${count.index+1}"
  machine_type = "${var.machine_type}"
  zone         = "${var.region}-${var.zone}"
  tags         = ["webserver"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = ""
    }
  }

  metadata {
    ssh-keys = "${var.ssh_username}:${file("${var.ssh_key}.pub")}"
  }

  /*provisioner "remote-exec" {
    connection {
      user        = "${var.ssh_username}"
      private_key = "${file("${var.ssh_key}")}"
    }
  }*/
}
