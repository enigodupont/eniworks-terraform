output "DNS" {
  value = aws_instance.eniworks.public_dns
}

output "IP" {
  value = aws_instance.eniworks.public_ip
}
