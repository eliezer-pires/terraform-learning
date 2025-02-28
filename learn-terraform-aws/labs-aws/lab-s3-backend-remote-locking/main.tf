# S3 Bucket
resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket_epterras3
    # Pesquisar
    lifecycle {
        prevent_destroy = true
    }
    tags = {
        Name        = "Terraform State Bucket"
        Environment = "Develop"
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name        = var.dynamodb_table
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    # Pesquisar
    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name        = "Terraform Lock Table"
        Environment = "Develop"
    }
}