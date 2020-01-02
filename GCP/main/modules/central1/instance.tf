resource "google_compute_instance_template" "default" {
  name                  = "centos7demotemplate" //Name of template
  description           = "This template is used to create nginx instances."
  tags = []  //Network Tags
  labels                = {
    environment         = "dev" //labels
  }
  instance_description  = "description assigned to instances"
  machine_type          = "n1-standard-1"
  can_ip_forward        = false
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }
  #Create a new boot disk from an image
  disk {
    source_image        = "centos7demonginx"  // Image name created using Packer
    auto_delete         = true
    boot                = true
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.public_subnet.name}"
    access_config {
      // Ephemeral IP
    }
  }
  metadata              = { 
    Name                = "Test"
  }
  service_account {
    scopes              = [ ]
  }
}
resource "google_compute_instance_group_manager" "instance_group_manager" {
  name                  = "centos7instancegroup" //Name of instance group
  instance_template     = "${google_compute_instance_template.default.self_link}"
  base_instance_name    = "centos7demoinstance" //Instance name
  zone                  = "us-central1-b"
  target_size           = "2" //How many instance required
}