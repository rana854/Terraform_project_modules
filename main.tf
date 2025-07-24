module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

module "iam" {
  source = "./modules/iam"
}


module "ec2" {
  source = "./modules/ec2"

  ami_id              = "ami-0c101f26f147fa7fd" # Amazon Linux 2 - us-east-1
  instance_type       = "t3.micro"
  vpc_id              = module.vpc.vpc_id
 // private_subnet_id   = module.vpc.private_subnet_id لان عندي 2 sabnet in diff az and ec2 need only one sabnet
 private_subnet_id = module.vpc.private_subnet_ids[0]
  key_name            = "my-key-pair" 
  iam_instance_profile = module.iam.instance_profile_name

}

module "rds" {
  source = "./modules/rds"

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_id          = module.ec2.security_group_id
  db_username        = "postgres"
  db_password        = "StrongPass123!"
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-secure-app-bucket-123456"  # لازم يكون اسم فريد عالميًا
}


module "lambda" {
  source              = "./modules/lambda"
  vpc_id              = module.vpc.vpc_id
  private_subnet_id   = module.vpc.private_subnet_ids[0]  # خده أول واحد بس
  rds_sg_id           = module.rds.rds_sg_id
  db_host             = module.rds.db_endpoint
  db_name             = "myappdb"
  db_user             = "postgres"
  db_password         = "StrongPass123!"
}

module "apigateway" {
  source      = "./modules/apigateway"
  lambda_name = module.lambda.lambda_name
  lambda_arn  = module.lambda.lambda_arn
}
/*
module "route53" {
  source                = "./modules/route53"
  hosted_zone_id        = "ZXXXXXXXXXXXXX"                # ID from Route 53 Console
  record_name           = "api.myapp.example.com"         # Subdomain
  api_gateway_domain_name = replace(module.apigateway.api_endpoint, "https://", "")
  api_gateway_zone_id   = "Z1UJRXOUMOOFQ8"                # us-east-1 API Gateway zone ID
}
*/
