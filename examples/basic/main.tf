module "example" {
  source = "../../"

  user  = "${aws_iam_user.user.name}"
  phase = "${var.phase}"
}

resource "aws_iam_user" "user" {
  name = "infraprints-user"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

variable "phase" {
  default = 1
}
