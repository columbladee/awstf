variable "region" {
  default = "us-west-2"
}

variable "ami" {
  type        = string
  description = "(optional) describe your variable"
}

variable "instance_type" {
  type        = string
  description = "(optional) describe your variable  "
}

variable "security_groups_ids" {
  type        = list(string)
  description = "(optional) describe your variable"
}