resource "google_sql_database_instance" "master" {
  region           = "${var.region}"
  database_version = "MYSQL_5_6"

  settings = {
    tier              = "${var.db_type}"
    activation_policy = "ALWAYS"
    pricing_plan      = "PER_USE"

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "authorized_network"
        value = "${var.db_authorized_network}"
      }

      authorized_networks {
        name  = "${google_compute_instance.webserver.0.name}"
        value = "${google_compute_instance.webserver.0.network_interface.0.access_config.0.assigned_nat_ip}"
      }

      authorized_networks {
        name  = "${google_compute_instance.webserver.1.name}"
        value = "${google_compute_instance.webserver.1.network_interface.0.access_config.0.assigned_nat_ip}"
      }

      authorized_networks {
        name  = "${google_compute_instance.webserver.2.name}"
        value = "${google_compute_instance.webserver.2.network_interface.0.access_config.0.assigned_nat_ip}"
      }
    }
  }

  timeouts {
    create = "30m"
    update = "10m"
  }
}

resource "google_sql_user" "user_webserver_1_master" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "${google_compute_instance.webserver.0.network_interface.0.access_config.0.assigned_nat_ip}"
}

resource "google_sql_user" "user_webserver_2_master" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "${google_compute_instance.webserver.1.network_interface.0.access_config.0.assigned_nat_ip}"
}

resource "google_sql_user" "user_webserver_3_master" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "${google_compute_instance.webserver.2.network_interface.0.access_config.0.assigned_nat_ip}"
}

/* resource "google_sql_database" "db_master" {
  name     = "${var.db_name_master}"
  instance = "${google_sql_database_instance.master.name}"
} */

resource "google_sql_database_instance" "slave" {
  region           = "${var.region}"
  database_version = "MYSQL_5_6"

  settings = {
    tier              = "${var.db_type}"
    activation_policy = "ALWAYS"
    pricing_plan      = "PER_USE"

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "authorized_network"
        value = "${var.db_authorized_network}"
      }

      authorized_networks {
        name  = "${google_compute_instance.webserver.0.name}"
        value = "${google_compute_instance.webserver.0.network_interface.0.access_config.0.assigned_nat_ip}"
      }

      authorized_networks {
        name  = "${google_compute_instance.webserver.1.name}"
        value = "${google_compute_instance.webserver.1.network_interface.0.access_config.0.assigned_nat_ip}"
      }
    }

    timeouts {
      create = "30m"
      update = "10m"
    }
  }
}

resource "google_sql_user" "user_webserver_1_slave" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.slave.name}"
  host     = "${google_compute_instance.webserver.0.network_interface.0.access_config.0.assigned_nat_ip}"
}

resource "google_sql_user" "user_webserver_2_slave" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.slave.name}"
  host     = "${google_compute_instance.webserver.1.network_interface.0.access_config.0.assigned_nat_ip}"
}

resource "google_sql_user" "user_webserver_3_slave" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.slave.name}"
  host     = "${google_compute_instance.webserver.2.network_interface.0.access_config.0.assigned_nat_ip}"
}

/* resource "google_sql_database" "db_slave" {
  name     = "${var.db_name_slave}"
  instance = "${google_sql_database_instance.slave.name}"
} */

