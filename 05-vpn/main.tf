
resource "aws_key_pair" "vpn" {
  key_name   = "openvpn"
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBKyO2xtXq3Dufnd0GQ1h9NtCuxOsHlxVNi/uo9nfeZrsa+0UKmcNfnZhNhxgPt5CuMdNnCR5OwoKFs7vR+Yl4G5XCKVDVfoa81bYPQQ7qg6ToDmpQREVRIAww+yPa9ewaZDvzmVDDOk2WzE3/q00KhZlWPjuGK9KeRfbVxqagcFjLe1NJPWqwmHwsZShtKJP1MoE/Wc6hV6+m82m24O9QT1FXVgWP3HhiByotHFl+iemNMkZgzmz67NnQglbfrHl7bYZDiJ0Dgxe3+V4X0K1w0HpSXtwkILZCWUSOBWtuuveoRTG8aeBj0E1mDEWcn3PQqYk8CG0QgBy0+u34OHPEcqBjDXFhFi/b7tPwPxQYPxTf4FgyQ57seuySE57vOukJ0U880+/SRpj6uBN0UKGat9/OSz8LH0IclPoMzpnpdTSVpNZZaV34d2Di4MKjKzlxyZRFwO/1aBwtML68eQPccku27dF6B4aY0WrgX0KAbNm2lgrSeU2sniCXRPCRRv8= harish@DESKTOP-TSJOBG3"
  public_key = file("openvpn.pub")
}




module "vpn" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  name                   = "${var.project_name}-${var.environment}-vpn"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  subnet_id              = local.public_subnet_id
  ami                    = data.aws_ami.ami_info.id
    
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-vpn"
    }
  )
}