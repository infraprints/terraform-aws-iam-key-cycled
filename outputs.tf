output "count" {
  description = ""
  value       = ["${local.count1}", "${local.count2}"]
}

output "states" {
  description = ""
  value       = ["${local.state1}", "${local.state2}"]
}
