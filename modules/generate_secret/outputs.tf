output "generated_password" {
  value       = length(random_password.administrator-login-password) > 0 ? random_password.administrator-login-password[0].result : ""
  description = "The generated admin password"
}
