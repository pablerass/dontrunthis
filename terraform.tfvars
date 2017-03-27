terragrunt = {
    # Configure Terragrunt to use DynamoDB for locking
    lock = {
        backend = "dynamodb"
        config {
            state_file_id = "${path_relative_to_include()}"
            table_name = "state-locks"
            aws_region = "eu-west-1"
        }
    }

    # Configure Terragrunt to automatically store tfstate files in S3
    remote_state = {
        backend = "s3"
        config {
            encrypt = "true"
            bucket = "dontrunthis.state"
            key = "${path_relative_to_include()}.tfstate"
            region = "eu-west-1"
        }
    }
}