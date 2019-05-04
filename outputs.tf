output "key1_count" {
  value = "${local.count1}"
}

output "key2_count" {
  value = "${local.count2}"
}

output "states" {
  value = ["${local.state1}", "${local.state2}"]
}

output "key1_state" {
  value = "${local.state1}"
}

output "key2_state" {
  value = "${local.state2}"
}
