module "example" {
  source = "../../"

  user  = "${aws_iam_user.user.name}"
  phase = 0
}

resource "aws_iam_user" "user" {
  name = "infraprints-user"
  path = "/system/"
}
