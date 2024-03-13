resource "aws_sqs_queue" "lms_import_data" {
  name                      = "lms-import-data"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600  # 4 days
  receive_wait_time_seconds = 20
  visibility_timeout_seconds = 30
}

resource "aws_sqs_queue_policy" "lms_import_data_policy" {
  queue_url = aws_sqs_queue.lms_import_data.id

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Principal: "*",
        Action: [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage"
        ],
        Resource: "arn:aws:sqs:ap-southeast-1:123456789123:lms-import-data"
      }
    ]
  })
}
