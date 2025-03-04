provider "google" {
  project = "sam-452209"
  region  = "us-east1"
  zone    = "us-east1-b"
  
}

locals {
  l1 = ["instance1", "instance2"]
}

resource "google_compute_instance" "inst1" {
  count        = length(local.l1)
  name         = local.l1[count.index]
  machine_type = "e2-micro"

  labels = {
    environment = "dev"
    owner       = "team-xyz"
  }

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
