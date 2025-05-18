output "result" {
  value = {
    file_name = "${var.talos_image.image_filename_prefix}-${split("_",local.image_id)[0]}-${split("_", local.image_id)[1]}-${var.talos_image.platform}-${var.talos_image.arch}.img"
    file_name_update = "${var.talos_image.image_filename_prefix}-${split("_",local.update_image_id)[0]}-${split("_", local.update_image_id)[1]}-${var.talos_image.platform}-${var.talos_image.arch}.img"
    url = "${var.talos_image.factory_url}/image/${split("_",local.image_id)[0]}/${split("_", local.image_id)[1]}/${var.talos_image.platform}-${var.talos_image.arch}.raw.gz"
    url_update = "${var.talos_image.factory_url}/image/${split("_",local.update_image_id)[0]}/${split("_", local.update_image_id)[1]}/${var.talos_image.platform}-${var.talos_image.arch}.raw.gz"
  }
}
