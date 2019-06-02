output "count" {
  description = ""
  value       = [local.count1, local.count2]
}

output "states" {
  description = ""
  value       = [local.state1, local.state2]
}

output "access_key" {
  description = "The access key ID."
  value       = local.key
}

output "secret_key" {
  description = "The secret access key. Note that this will be written to the state file."
  value       = local.secret
}

