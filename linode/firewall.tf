module "linode_prod_firewall_label" {
  source = "cloudposse/label/null"

  namespace  = "linode"
  stage      = "prod"
  name       = "bastion"
  attributes = ["public"]
  delimiter  = "-"

  tags = {
    "Terraformed" = "true"
  }
}
