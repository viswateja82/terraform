provider "google" {
  project                = "${var.gcp_project}"
  region                 = "${var.region}"
  credentials            = "${file("${var.credentials}")}"
#  credentials            = "${file("newproject.json")}"
}
module "vpc" {
  source                 = "../modules/global" 
 // env                  = "${var.environment}"
  central1_public_subnet = "${var.central1_public_subnet}"
  central1_private_subnet= "${var.central1_private_subnet}"
}
module "central1" {
  source                 = "../modules/central1"
  central1_public_subnet = "${var.central1_public_subnet}"
  central1_private_subnet= "${var.central1_private_subnet}"
}
