aws dynamodb create-table --table-name 'serverless_workshop_intro' --attribute-definitions AttributeName=_id,AttributeType=S --key-schema AttributeName=_id,KeyType=HASH --billing-mode PAY_PER_REQUEST

aws lambda create-function --function-name 'm1-add-sample-data' --runtime 'python3.13' --role 'arn:aws:iam::239221172306:role/mylambda' --code S3Bucket='dvccserverless',S3Key='m1-add-sample-data.zip' --handler 'lambda_function.lambda_handler' --package-type 'Zip'

aws s3 rb 's3://dvccserverless' --force

aws dynamodb delete-table --table-name 'serverless_workshop_intro'

aws lambda delete-function --function-name 'm1-add-sample-data'