variable "ami" {
  description = "The AMI to use for the instance"
  type        = string

}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string

}

variable "security_groups_ids" {
  description = "The security group IDs to attach to the instance"
  type        = list(string)

}