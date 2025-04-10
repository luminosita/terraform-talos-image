locals {
  version = var.image.version
  schematic = var.image.schematic
  schematic_id = jsondecode(data.http.schematic_id.response_body)["id"]
  image_id = "${local.schematic_id}_${local.version}"

  update_version = coalesce(var.image.update_version, var.image.version)
  update_schematic = coalesce(var.image.update_schematic, var.image.schematic)
  update_schematic_id = jsondecode(data.http.updated_schematic_id.response_body)["id"]
  update_image_id = "${local.update_schematic_id}_${local.update_version}"
}

data "http" "schematic_id" {
  url          = "${var.image.factory_url}/schematics"
  method       = "POST"
  request_body = file("${path.module}/image/${local.schematic}")
}

data "http" "updated_schematic_id" {
  url          = "${var.image.factory_url}/schematics"
  method       = "POST"
  request_body = file("${path.module}/image/${local.update_schematic}")
}

resource "talos_image_factory_schematic" "this" {
  schematic = file("${path.module}/image/${local.schematic}")
}

resource "talos_image_factory_schematic" "updated" {
  schematic = file("${path.module}/image/${local.update_schematic}")
}

