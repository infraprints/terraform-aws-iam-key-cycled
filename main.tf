locals {
  states = [
    {
      primary   = "Active"
      secondary = "None"
    },
    {
      primary   = "Active"
      secondary = "Active"
    },
    {
      primary   = "Inactive"
      secondary = "Active"
    },
    {
      primary   = "None"
      secondary = "Active"
    },
    {
      primary   = "Active"
      secondary = "Active"
    },
    {
      primary   = "Active"
      secondary = "Inactive"
    },
  ]

  primary = [
    0,
    1,
    1,
    0,
    0,
    0,
  ]
}

locals {
  state1 = "${lookup(local.states[var.phase], "primary", "None")}"
  state2 = "${lookup(local.states[var.phase], "secondary", "None")}"
}

locals {
  count1 = "${local.state1 == "None" ? 0 : 1}"
  count2 = "${local.state2 == "None" ? 0 : 1}"
}

resource "aws_iam_access_key" "key_one" {
  count  = "${local.count1}"
  status = "${local.state1}"
  user   = "${var.user}"
}

resource "aws_iam_access_key" "key_two" {
  count  = "${local.count2}"
  status = "${local.state2}"
  user   = "${var.user}"
}

locals {
  keys    = "${concat(aws_iam_access_key.key_one.*.id, aws_iam_access_key.key_two.*.id)}"
  secrets = "${concat(aws_iam_access_key.key_one.*.secret, aws_iam_access_key.key_two.*.secret)}"

  key    = "${local.keys[element(local.primary, var.phase)]}"
  secret = "${local.secrets[element(local.primary, var.phase)]}"
}
