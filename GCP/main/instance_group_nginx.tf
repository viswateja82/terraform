resource "google_compute_instance_template" "default" {
  name        = "demo-template" //Name 
  description = "This template is used to create nginx instances."

  tags = ["gke-cluster-1630890f-node"]  //Network Tags

  labels = {
    environment = "dev"  //Labels
  }

  instance_description = "description assigned to instances"
  machine_type         = "n1-standard-1"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  #Create a new boot disk from an image
  disk {
    source_image = "demo"  // Image name created using Packer
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
  }

  metadata = {
    Name = "Test"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  name               = "demo-group-manager" //Name of instance group
  instance_template  = "${google_compute_instance_template.default.self_link}"
  base_instance_name = "demo-group" //Instance name
  zone               = "us-central1-f"
  target_size        = "2" //How many instance required
}
