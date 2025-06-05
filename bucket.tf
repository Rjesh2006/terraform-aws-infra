
#here we creted the bucket for remote backed to store the teraformtf.states

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

#here we have created the the dynamodb table for the locking so that multiples conflicts shoudnt be accur here ( till the previous user didnt release the lock (lock id) )
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST" 
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
  }
}