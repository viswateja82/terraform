resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.environment}-${var.region}-pub-net"
  ip_cidr_range = "${var.central1_public_subnet}"
  network       = "default"
  region        = "${var.region}"
}
resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.environment}-${var.region}-pri-net"
  ip_cidr_range = "${var.central1_private_subnet}"
  region        = "${var.region}"
  network       = "default"
}
