terraform{
  backend "s3" {
    bucket = "terraform-a17"
    key    = "misc/jenkins-ip/prod/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {

  instance_id = "i-0f1bb459829388093"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.devopsa17.online"
  type    = "A"
  zone_id = "Z05576924GZ1MK3S5OBT"
  records =[data.aws_instance.instance.public_ip]
  ttl = 10
}