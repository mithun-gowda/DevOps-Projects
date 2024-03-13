

## Step 1: Set Up AWS Environment
- Create an AWS Account: If you haven't already, sign up for an AWS account.
- Install AWS CLI: Install AWS Command Line Interface (CLI) on your local machine.
- Configure AWS CLI: Run aws configure and enter your AWS access key ID and secret access key.

## Step 2: Create Lambda Function
- Create a Lambda Function: Go to the AWS Lambda console and create a new Lambda function.
- Code the Lambda Function: Write the code for the Lambda function. Below is a sample Python code snippet:
```
import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    ebs = boto3.client('ec2')
    
    # Get list of EBS snapshots
    snapshots = ebs.describe_snapshots(OwnerIds=['self'])['Snapshots']
    
    # Get list of active EC2 instances
    instances = ec2.describe_instances(Filters=[{'Name': 'instance-state-name', 'Values': ['running', 'stopped']}])['Reservations']
    
    active_volumes = set()
    for instance in instances:
        for i in instance['Instances']:
            for volume in i['BlockDeviceMappings']:
                active_volumes.add(volume['Ebs']['VolumeId'])
    
    # Delete stale snapshots
    for snapshot in snapshots:
        if snapshot['VolumeId'] not in active_volumes:
            ebs.delete_snapshot(SnapshotId=snapshot['SnapshotId'])
```
- Set Up Execution Role: Create an IAM role with necessary permissions for Lambda function to interact with EC2 and EBS.
- Configure Triggers: You can set up CloudWatch Events as a trigger to schedule the Lambda function to run at specified intervals.

## Step 3: Testing
- Test the Lambda Function: Test your Lambda function manually to ensure it behaves as expected.
- Monitor Execution: Monitor the execution of the Lambda function to verify that it is deleting stale snapshots correctly.

## Step 4: Additional Optimizations
- Implement Lifecycle Policies for EBS Snapshots: Set up lifecycle policies in the AWS Management Console to automate the deletion of old snapshots.
- Review and Optimize: Regularly review your AWS environment for further optimization opportunities.


### **NOTE:** By following these steps, you can implement the project to optimize storage costs by automatically deleting stale EBS snapshots associated with inactive EC2 instances.