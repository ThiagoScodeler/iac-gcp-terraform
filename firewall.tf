resource "google_compute_firewall" "fw" {
  name    = "webserver-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver"]
}
