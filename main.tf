resource "oci_datascience_project" "datascience_projects" {
  for_each = var.datascience_projects

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

