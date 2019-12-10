 
output "front_end" {
  value = module.front-end.front_end_fqdn
}

output "management" {
  value = module.management.manager_fqdn
}