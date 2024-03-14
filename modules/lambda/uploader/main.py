import boto3
import os

def handler(event, context):
    # Get the bucket name and KMS key ID from environment variables
    bucket_name = os.environ['BUCKET_NAME']
    kms_key_id = os.environ['KMS_KEY_ID']

    file_path = event['file_path']

    s3_client = boto3.client('s3')

    try:
        # Upload the file to S3 with server-side encryption using the specified KMS key
        s3_client.upload_file(file_path, bucket_name, os.path.basename(file_path), ExtraArgs={'ServerSideEncryption': 'aws:kms', 'SSEKMSKeyId': kms_key_id})
        
        return {
            'statusCode': 200,
            'body': f"File {file_path} uploaded successfully"
        }
    except Exception as e:
        print(f"Error uploading file: {str(e)}")
        return {
            'statusCode': 500,
            'body': 'Error uploading file'
        }
