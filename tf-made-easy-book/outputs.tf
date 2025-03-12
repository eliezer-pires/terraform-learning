# Step 5: Adicionando Outputs (saídas)
output "ep_bucket_east1" {
  value       = aws_s3_bucket.east1-bucket-us.bucket
  description = "Bucket tf-learn-eliezerpires-bucket"
}
