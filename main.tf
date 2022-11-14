provider "google"{
    credentials = file("example.json")
    project = "example"
    region = "us-west1"
    zone = "us-west1-c"
}

resource "google_project_service" "api"{
    for_each = toset([
        "cloudresourcemanager.googleapis.com",
        "compute.googleapis.com"
    ])
    disable_on_destroy = false
    service = each.value
}
resource "google_compute_firewall" "web" {
    name = "web-access"
    network = "default"
    source_ranges = ["0.0.0.0/0"]
    allow{
        protocol = "tcp"
        ports = ["80","443"]
    }
}

resource "google_compute_instance" "lab4" {
    name = "my-gcp-server"
    machine_type = "f1-micro"
    boot_disk{
        initialize_params {
            image = "ubuntu-2004-focal-v20210720"
        }
    }
    network_interface {
        network = "default"
        access_config {}
    }
    metadata_startup_script = <<EOF
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    echo "<h1>Gryga Misha IPZ1.1 LAB4</h1>" > /var/www/html/index.html
    systemctl restart apache2
    EOF

    depends_on = [google_project_service.api, google_compute_firewall.web]
}

