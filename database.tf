# Database subnet group
resource "aws_db_subnet_group" "db_subnet"  {
    name       = "db-subnet"
    subnet_ids = [aws_subnet.subnets[2].id, aws_subnet.subnets[3].id]
}

# Create database instance
# resource "aws_db_instance" "project_db" {
#   allocated_storage    = 5
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   identifier           = "db-instance"
#   db_name              = "sqldatabase"
#   username             = "admin"
#   password             = "password"
#   db_subnet_group_name = aws_db_subnet_group.db_subnet.id
#   vpc_security_group_ids = [aws_security_group.rds_sg.id]
#   publicly_accessible = false
#   skip_final_snapshot  = true
#   multi_az = true
# }

# Create a PostgreSQL RDS Instance
resource "aws_db_instance" "postgres" {
    identifier              = "ace-postgres-db"
    allocated_storage       = 20  # Storage in GB
    max_allocated_storage   = 100 # Auto-scaling limit
    engine                 = "postgres"
    engine_version         = "14.17"
    instance_class         = "db.t3.micro"  # Change based on needs
    username              = "adminuser"
    password              = "StrongPassword123!"  # Change this securely
    parameter_group_name  = "default.postgres14"
    publicly_accessible   = false
    db_subnet_group_name = aws_db_subnet_group.db_subnet.id
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    skip_final_snapshot    = true
    multi_az              = false
    storage_encrypted     = true

    tags = {
        Name = "ace-postgres-db"
        Environment = "dev"
    }
}
