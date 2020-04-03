# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type    = string
  default = "172.0.0.0/16"
}