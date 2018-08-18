resource "google_compute_http_health_check" "webserver" {
  name                = "http"
  request_path        = "/"
  check_interval_sec  = 1
  healthy_threshold   = 1
  unhealthy_threshold = 3
  timeout_sec         = 1
}

resource "google_compute_target_pool" "webserver" {
  name          = "webserver-pool"
  instances     = ["${google_compute_instance.webserver.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.webserver.name}"]
}
