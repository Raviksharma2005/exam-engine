terraform {
  required_version = ">= 1.0"
}

resource "local_file" "proctor_status" {
  content  = "PROCTOR_STATUS=ACTIVE\nSERVICE_NAME=exam-proctor\nENVIRONMENT=production\n"
  filename = "${path.module}/proctor_status.env"
}

output "status_file" {
  value = local_file.proctor_status.filename
}
