output "result" {
  value = {
    file_name = "${var.image.image_filename_prefix}-${split("_",local.image_id)[0]}-${split("_", local.image_id)[1]}-${var.image.platform}-${var.image.arch}.img"
    file_name_update = "${var.image.image_filename_prefix}-${split("_",local.update_image_id)[0]}-${split("_", local.update_image_id)[1]}-${var.image.platform}-${var.image.arch}.img"
    url = "${var.image.factory_url}/image/${split("_",local.image_id)[0]}/${split("_", local.image_id)[1]}/${var.image.platform}-${var.image.arch}.raw.gz"
    url_update = "${var.image.factory_url}/image/${split("_",local.update_image_id)[0]}/${split("_", local.update_image_id)[1]}/${var.image.platform}-${var.image.arch}.raw.gz"
  }
}
