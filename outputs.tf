# Outputs for Single Instance
/*
output "ec2_public_ip" {
  value = aws_instance.test_instance.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.test_instance.private_ip
}
*/
#-------------------------------------------
# Outputs for count
/*
output "ec2_public_ip" {
  value = aws_instance.test_instance[*].public_ip
}

output "ec2_private_ip" {
  value = aws_instance.test_instance[*].private_ip
}
*/
#-------------------------------------------
# Outputs for "for-each" (Optional Way to perform)
/*
output "ec2_public_ip" {
  value = values(aws_instance.test_instance)[*].public_ip
}

output "ec2_private_ip" {
  value = values(aws_instance.test_instance)[*].private_ip
}
*/
#--------------------------------------------

# Outputs for "for-each" meta-arguments (Recommended Way)

output "ec2_Private_ip" {
  value = {
    for krishnakey, krishnavalue in aws_instance.test_instance : krishnakey => krishnavalue.private_ip
}
}

output "ec2_Public_ip" {
  value = {
    for krishnakey, krishnavalue in aws_instance.test_instance : krishnakey => krishnavalue.public_ip
}
}
