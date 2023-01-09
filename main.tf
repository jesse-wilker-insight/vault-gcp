provider "google" {
  project = "wiker-sandbox"
  region  = "us-east1"
}

provider "google-beta" {
  project = "wiker-sandbox"
  region  = "us-east1"
}

module "vault-ent" {
  source               = "hashicorp/vault-ent-starter/gcp"
  version              = "0.1.2"

  # The shared DNS SAN of the TLS certs being used
  leader_tls_servername  = "vault.server.com"

  #Your GCP project ID
  project_id             = "wiker-sandbox"

  # Prefix for uniquely identifying GCP resources
  resource_name_prefix   = "test"

  # Self link of the subnetwork you wish to deploy into
  subnetwork             = "https://www.googleapis.com/compute/v1/projects/wiker-sandbox/regions/us-east1/subnetworks/subnet-01"

  # Name of the SSL Certificate to be used for Vault LB
  ssl_certificate_name   = "vault-20230109172453118400000001"

  # Secret id/name given to the google secret manager secret
  tls_secret_id          = "terraform_example_module_vault_tls_secret"
  
  # Path to Vault Enterprise license file
  vault_license_filepath = "./vault.hclic"
}