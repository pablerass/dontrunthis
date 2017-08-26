provider "aws" {
  version = "~> 0.1"

  region = "eu-west-1"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_key_pair" "main" {
  key_name   = "main"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDE200iTcQp8UktBuL6UtqAcqoOEfQ304/bxoNxsYCeos4VZZYeKM84Fj9Eqdx0d2IJj8+DlMGzo4aeTpHNz2I+0Ma5Mj+ebMUzdYd+3Kw1b4n3RZJ+zHQ4zRIxp2aAsB1PZ+km9LHkE+cneGrfOoilkmmp0CzaD1XDAAMz6K2LZoOaFBebsVkEVTKKNkaXoh4KnPfk31+/EHsHO+fFsb5M7q8FcnPj4bzjMzgHqzaOlWnWRzDdHCJHtXgVY+rMCWE09RALXvGlNh1Q1jbM5jsz6Z+QgjYv0bYLvmR3JjQrK1Tj+noe/crKYsgFyflgKMbg3Wn4jShMd5EDcyVWV3TTYe1h05dni1d/b5AMbg8oYm9gKqNSQbDUDGYxyhYKUEDbvZTxCOkUDOA+eVs700rioZEyob0UnUkGcw/NP3zW1uSi/s9Whiq1eaFAj0FDpL7URbNk634uH9oLsoy2PATajaRW/2ZlOUreGMOOLJFSpeOClRsCkVCf86Fauo011EyuOLaKCwreZCEcQv7Fv98TsN/mfC2OAHSBPp8YYzrmJTeObyP0ZBhxu2m5Kj3Al3Zj9k/Pun+Af9f1EYrgS9TY+XH4CW3nQ6VNqMR2DMqGKTjmAc17su/ed+KtJ629lmQDgGLVi4zJxKbTIetMreR2Gb2LieZSuA3JK28uA/m42Q=="
}
