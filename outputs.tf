output "DNS" {
  value = aws_instance.web.public_dns
}

output "HTML" {
  value = "http://${aws_instance.web.public_dns}"
}
