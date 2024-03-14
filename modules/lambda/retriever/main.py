import boto3
import os

def handler(event, context):
    # Get the bucket name from environment variables
    bucket_name = os.environ['BUCKET_NAME']

    object_key = event['Records'][0]['s3']['object']['key']

    s3_client = boto3.client('s3')
    
    try:
        # Retrieve the object from S3
        response = s3_client.get_object(Bucket=bucket_name, Key=object_key)

        print("Content of the retrieved object:")
        print(response['Body'].read().decode('utf-8'))

        return {
            'statusCode': 200,
            'body': 'Retrieved object successfully'
        }
    except Exception as e:
        print(f"Error retrieving object: {str(e)}")
        return {
            'statusCode': 500,
            'body': 'Error retrieving object'
        }
