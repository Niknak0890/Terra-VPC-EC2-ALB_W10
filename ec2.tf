resource "aws_instance" "server1" {
  ami = "ami-02d7fd1c2af6eead0"
  instance_type = var.INSTANCE_TYPE
  vpc_security_group_ids = [ aws_security_group.sg1.id ]
  availability_zone = "${var.REGION}a"
  subnet_id = aws_subnet.private1.id
  user_data = file("code.sh")
  key_name = "w10key"
  tags = {
    Name = var.ENVIRONMENT
  }
}

resource "aws_instance" "server2" {
  ami = "ami-02d7fd1c2af6eead0"
  instance_type = var.INSTANCE_TYPE
  vpc_security_group_ids = [ aws_security_group.sg1.id ]
  availability_zone = "${var.REGION}b"
  subnet_id = aws_subnet.private2.id
  user_data = file("code.sh")
  key_name = "w10key"
  tags={
    Name = "server2"
  }
}

#ami can be collected using a data source
  ##in this case it was taken from amazon for amazon linux ami (can take when preparing an instance manually)