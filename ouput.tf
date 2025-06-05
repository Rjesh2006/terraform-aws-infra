# this files is just use to print the think at the end of the provisininng of the resources by usin the attrbutes to print the output.
# output "server_ip" {
#     value = aws_instance.ec2_server.public_ip
# }

# output "server_dns" {
#     value = aws_instance.ec2_server.public_dns
# }


# here we used the for loop to print the each servers ip and the dns beause we can't do it witout loop beause the both loops are creted by the single time with the help of for_each tomap() fucntion for more infor visit to the ec2.tf file.
output "pint_each_server_ip" {
value = [
    for Instance in aws_instance.ec2_server:Instance.public_ip
 ]
  
}


output "pint_each_server_dns" {
value = [
    for Instance in aws_instance.ec2_server:Instance.dns
 ]
  
}
