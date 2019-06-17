output "ip" {
  value = "${google_compute_address.default.address}"
}