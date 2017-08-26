terragrunt = {
    # Configure Terragrunt to automatically store tfstate files in S3
    remote_state = {
        backend = "s3"
        config {
            bucket = "dontrunthis.state"
            region = "eu-west-1"
            encrypt = true
            key = "${path_relative_to_include()}.tfstate"

            dynamodb_table = "state-locks"
        }
    }
}