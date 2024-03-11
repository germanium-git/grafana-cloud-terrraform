terraform {
  required_version = "~> 1.7.3"
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 2.5.0"
    }
  }
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "mygermanium"
    workspaces {
      name = "grafana-cloud"
    }
  }
}

provider "grafana" {
  url  = var.GRAFANA_URL
  auth = var.GRAFANA_AUTH
}
