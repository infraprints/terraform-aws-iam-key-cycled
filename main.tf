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
}

locals {
  count1 = "${lookup(local.states[var.phase], "primary", "None") == "None" ? 0 : 1}"
  count2 = "${lookup(local.states[var.phase], "secondary", "None")== "None" ? 0 : 1}"
  state1 = "${lookup(local.states[var.phase], "primary", "None")}"
  state2 = "${lookup(local.states[var.phase], "secondary", "None")}"
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
