module "example" {
  source = "../../"

  user  = "${aws_iam_user.user.name}"
  phase = "${var.phase}"
}

resource "aws_iam_user" "user" {
  name = "infraprints-user"
  path = "/system/"
}

output "states" {
  value = "${module.example.states}"
}

output "key" {
  value = "${module.example.access_key}"
}

output "secret" {
  value = "${module.example.secret_key}"
}

variable "phase" {
  type        = "string"
  description = "Passthrough of the current state. Used by scripts to automate."
  default     = 0
}
