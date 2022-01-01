module "linode_prod_lke_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.19.2"
  namespace  = "linode"
  stage      = "prod"
  name       = "lke"
  attributes = ["public"]
  delimiter  = "-"

  tags = {
    "Terraformed" = "true"
  }
}

resource "linode_lke_cluster" "lke_cluster" {
  label       = join("-", compact([module.linode_prod_lke_label.namespace, module.linode_prod_lke_label.stage, module.linode_prod_lke_label.name]))
  k8s_version = "1.22"
  region      = "eu-west"
  tags        = ["prod"]

  pool {
    type  = "g6-standard-1"
    count = 3
  }

  control_plane {
    high_availability = true
  }
}
