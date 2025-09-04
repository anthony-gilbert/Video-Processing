resource "aws_instance" "web" {
    ami           = "ami-00ca32bbc84273381"
    instance_type = "t2.nano"
}
