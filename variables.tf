variable "vpc_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}

variable "env_name" {
  type = string
}

variable "private_subs" {
  type = list
}
variable "public_subs" {
  type = list
}