data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

output "ami_id" {
  value = data.aws_ami.centos.image_id
}

data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "instance_type" {
  default = "t3.small"
}

variable "components" {
  default = ["frontend", "mangodb", "catalogue"]
}

resource "aws_instance" "frontend" {
  count         = length(var.components)
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.components[count.index]
  }
}

#resource "aws_route53_record" "frontend" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "frontend-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.frontend.private_ip]
#}
#
#resource "aws_instance" "mangodb" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "mangodb"
#  }
#}
#
#resource "aws_route53_record" "mangodb" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "mangodb-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mangodb.private_ip]
#}
#
#resource "aws_instance" "catalogue" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "catalogue"
#  }
#}
#
#resource "aws_route53_record" "catalogue" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "catalogue-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.catalogue.private_ip]
#}
#
#resource "aws_instance" "redis" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "redis"
#  }
#}
#
#resource "aws_route53_record" "redis" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "redis-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.redis.private_ip]
#}
#
#resource "aws_instance" "user" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "user"
#  }
#}
#
#resource "aws_route53_record" "user" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "user-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.user.private_ip]
#}
#
#resource "aws_instance" "cart" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "cart"
#  }
#}
#
#resource "aws_route53_record" "cart" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "cart-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.cart.private_ip]
#}
#
#resource "aws_instance" "mysql" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "mysql"
#  }
#}
#
#resource "aws_route53_record" "mysql" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "mysql-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.mysql.private_ip]
#}
#
#resource "aws_instance" "shipping" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "shipping"
#  }
#}
#
#resource "aws_route53_record" "shipping" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "shipping-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.shipping.private_ip]
#}
#
#resource "aws_instance" "rabbitmq" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "rabbitmq"
#  }
#}
#
#resource "aws_route53_record" "rabbitmq" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "rabbitmq-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.rabbitmq.private_ip]
#}
#
#resource "aws_instance" "payment" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "payment"
#  }
#}
#
#resource "aws_route53_record" "payment" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "payment-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.payment.private_ip]
#}
#
#resource "aws_instance" "dispatch" {
#  ami           = data.aws_ami.centos.image_id
#  instance_type = var.instance_type
#
#  tags = {
#    Name = "dispatch"
#  }
#}
#
#resource "aws_route53_record" "dispatch" {
#  zone_id = "Z0836279H2APHQR6Z7HR"
#  name    = "dispatch-dev.gdevops89.online"
#  type    = "A"
#  ttl     = 30
#  records = [aws_instance.dispatch.private_ip]
}