# AWS S3 Event Triggering

**NOTE**: REPLACE YOUR AWS ACCOUNT ID IN THE LAMBDA FUNCTION CODE.

AWS S3 Event triggering is a popular project used by top companies in the Industry.

Here are some examples of top companies that use S3 event triggering:

**Netflix**: Netflix use S3 event triggering to automatically process video files uploaded to Amazon S3, enabling seamless content ingestion and processing.

**Airbnb**: This lodging and homestays aggregator use S3 event triggering to automatically process and analyze data stored in Amazon S3, such as guest reviews and booking information.

**Expedia**: They use S3 event triggering to automatically process and analyze data stored in Amazon S3, such as travel bookings, user profiles, and pricing information, to power their personalized travel recommendations and search features.


![Screenshot 2023-04-14 at 7 06 46 PM](https://user-images.githubusercontent.com/43399466/232058778-a7299e9b-9892-471c-a05d-14d773b5b333.png)

**User**: User first plans to create AWS bucket, selects region and other configuration. this are done using shell scripting / AWS command Line interface.<br>
**S3 Bucket**: Amazon Simple Storage Service (S3) is a cloud-based object storage service provided by Amazon Web Services (AWS). S3 allows users to store and retrieve data from anywhere on the web.<br>
**Lambda function**: 
        - A lambda function can be configured to trigger automatically in response to events such as adding a file to an S3 bucket. Once a file is added to the S3 bucket, the lambda function is invoked, and it can perform various actions based on the event.<br>
        - AWS STS (Security Token Service) and IAM (Identity and Access Management) play important roles in managing access and permissions for Lambda functions in AWS.<br>
        - **IAM**: an IAM role that grants permissions to the function. IAM roles define what AWS resources the function can access and what actions it can perform on those resources.<br>
        - **AWS STS**: The AWS STS service provides temporary security credentials that can be used by Lambda functions to access other AWS resources. <br>
        - IAM roles define the permissions for Lambda functions, while AWS STS provides temporary credentials that allow Lambda functions to access other AWS resources securely. This combination helps ensure that Lambda functions have the appropriate level of access to AWS services and resources, following the principle of least privilege.<br>
**SNS**: After Lambda function has completed its processsing it interact with Amazon SNS to send notifications<br>
         - SNS delivers the notification message to all subscribed endpoints asynchronously. 
          Depending on the type of subscriber, the notification might be delivered via email, 
          SMS, HTTP/HTTPS POST request<br>
