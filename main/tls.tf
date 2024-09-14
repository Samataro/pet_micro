provider "tls" {
  # No configuration required here for this example
}

resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "main" {
  private_key_pem = tls_private_key.main.private_key_pem

  subject {
    common_name = var.main_host
    organization = "Example Org"
  }

  validity_period_hours = 8760 # Valid for 1 year

  dns_names = ["example.com"]
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "kubernetes_secret" "tls" {
  metadata {
    name = "tls-main"
    namespace = var.namespace
  }

  data = {
    "tls.crt" = tls_self_signed_cert.main.cert_pem
    "tls.key" = tls_private_key.main.private_key_pem
  }

  type = "kubernetes.io/tls"
}