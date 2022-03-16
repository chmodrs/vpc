#Copyright 2019 Fairwinds Inc.
#
#Licensed under the Apache License, Version 2.0 (the “License”);
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an “AS IS” BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

variable "aws_region" {
  default = "sa-east-1"
}

variable "aws_vpc_name" {
  default = "POC-VPC"
}

variable "aws_azs" {
  description = "comma separated string of availability zones in order of precedence"
  default     = "sa-east-1a, sa-east-1b, sa-east-1c"
}

variable "az_count" {
  description = "number of active availability zones in VPC"
  default     = "3"
}

variable "vpc_cidr_base" {
  default = "10.245"
}

variable "vpc_instance_tenancy" {
  default = "default"
}

variable "vpc_enable_dns_support" {
  default = "true"
}

variable "vpc_enable_dns_hostnames" {
  default = "true"
}

variable "vpc_enable_classiclink" {
  default = "false"
}

variable "admin_subnet_parent_cidr" {
  description = "parent CIDR for the administrative subnets"
  default     = ".0.0/19"
}

variable "admin_subnet_cidrs" {
  description = "CIDRs for the adminsitrative subnets"
  default = {
    zone0 = ".0.0/21"
    zone1 = ".8.0/21"
    zone2 = ".16.0/21"
    zone3 = ".24.0/21"
  }
}

variable "admin_subnet_tags" {
  description = "Tags to apply to the admin subnet"
  default     = {}
}

variable "public_subnet_parent_cidr" {
  description = "parent CIDR for the public subnets"
  default     = ".32.0/19"
}

variable "public_subnet_cidrs" {
  description = "CIDRs for the public subnets"
  default = {
    zone0 = ".32.0/21"
    zone1 = ".40.0/21"
    zone2 = ".48.0/21"
    zone3 = ".56.0/21"
  }
}

variable "public_subnet_tags" {
  description = "Tags to apply to the public subnets"
  default     = {}
}

variable "private_prod_subnet_parent_cidr" {
  description = "parent CIDR for the private production subnets"
  default     = ".64.0/19"
}

variable "private_prod_subnet_cidrs" {
  description = "CIDRs for the private production subnets"
  default = {
    zone0 = ".64.0/21"
    zone1 = ".72.0/21"
    zone2 = ".80.0/21"
    zone3 = ".88.0/21"
  }
}

variable "private_prod_subnet_tags" {
  description = "Tags to apply to the private production subnets"
  default     = {}
}

variable "private_working_subnet_parent_cidr" {
  description = "parent CIDR for the private working subnets"
  default     = ".96.0/19"
}

variable "private_working_subnet_cidrs" {
  description = "CIDRs for the private working subnets"
  default = {
    zone0 = ".96.0/21"
    zone1 = ".104.0/21"
    zone2 = ".112.0/21"
    zone3 = ".120.0/21"
  }
}

variable "private_working_subnet_tags" {
  description = "Tags to apply to the private working subnets"
  default     = {}
}

variable "multi_az_nat_gateway" {
  description = "place a NAT gateway in each AZ"
  default     = 0
}

variable "single_nat_gateway" {
  description = "use a single NAT gateway to serve outbound traffic for all AZs"
  default     = 1
}

variable "enable_s3_vpc_endpoint" {
  description = "Create a VPC S3 gateway endpoint and private subnet route entries. This will route S3 traffic over private network rather than over NAT gateways."
  default     = "true"
}


variable "s3_vpc_endpoint_policy" {
  description = "S3 VPC endpoint gateway policy document. Bucket and IAM policies still apply."
  default     = <<POLICY
{
    "Statement": [
        {   
            "Sid": "FullAccess",
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ],
    "Version": "2008-10-17"
}
POLICY

}


variable "s3_vpc_endpoint_route_table_ids" {
  description = "By default routes to the s3 endpoint are added for private subnet route tables. Pass additional route table ids that require routes."
  type        = list(string)
  default     = []
}


variable "internet_gateway_tags" {
  description = "Tags to apply to the internet gateway"
  default     = {}
}

variable "public_route_table_tags" {
  description = "Tags to apply to the public route table"
  default     = {}
}

variable "private_route_table_tags" {
  description = "Tags to apply to the private route table"
  default     = {}
}

variable "global_tags" {
  description = "AWS tags that will be added to all resources managed herein"
  type        = map(string)
  default = {
    "CentroCusto" = "MPCE-POC"
  }
}

variable "customer_gateway_id" {
  description = "ID do customer gateway"
  default     = "cgw-0194dd2d4b4d5e996"
}

