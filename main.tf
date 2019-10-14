terraform {
  backend "consul" {
    address = "10.42.1.1:8500"
    scheme = "http"
    path = "terraform_state"
  }
}

provider "nomad" {
  address = "http://10.42.1.1:4646"
  version = "~> 1.4"
}

resource "nomad_job" "vmck" {
  jobspec = "${file("${path.module}/nomad_jobs/vmck.hcl")}"
}
