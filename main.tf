provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "us-east-1"
}



resource "aws_instance" "web" {
  ami           = "ami-9887c6e7"
  instance_type = "m4.2xlarge"
  key_name = "TERRAJENK"
  security_groups= ["CentOS 7 -x86_64- - with Updates HVM-1805_01-AutogenByAWSMP-"]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 100
    volume_type = gp2
    delete_on_termination = true
  }

  tags {
    Name = "Hadoop-Cluster"
  }
  count = 4
}
