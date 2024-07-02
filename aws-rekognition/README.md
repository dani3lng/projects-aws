### Image Labels Generator

## Services Used
- Amazon S3: For storing the images in the process of generating labels.
- Amazon Rekognition: To analyze images and generate image labels.
- AWS CLI: Interacting with AWS services through the command line interface (CLI).

## Overview of Project
In this project, we will be building an image labels generator, using Amazon Rekognition. This is going to be a fun one. Once built, it will be able to recognize and label images. For example, if you have a photo of a cat, Amazon Recognition will be able to identify what it is, and label the image as a cat.

## Steps to be performed
1. Create an Amazon S3 Bucket
2. Upload images to the S3 Bucket
3. Install/configure the AWS Command line interface (CLI)
4. Import libraries
5. Add detect_labels function
6. Add main function
7. Run python file

## Estimated Time & Cost
- 20-30 minutes
- Cost: Free (When using the AWS Free Tier)

## Architectural Diagram
![picture](https://github.com/dani3lng/projects-aws/blob/main/aws-rekognition/label-generator/images/a1.png)

## Step by Step
1. Log into your AWS Management Console
2. Search for the Amazon S3 service
3. Create a bucket with a unique name and select the region where you want the storage bucket
4. Continue with default setting for the S3 bucket
5. The S3 bucket is where we will store the images on which labels are to be generated
6. After creating the S3 bucket, upload images you want to analyze from your system
7. Open your terminal or command prompt
8. Run the command appropriate for you operating system to install the AWS CLI
    #For Windows:
    msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

    #For macOS (using Homebrew):
    brew install awscli

    #For Linux (using package manager):
    sudo apt-get install awscli
9. Verify AWS CLI was installed successfully on your system using the following command:
    aws --version
10. Configure your AWS CLI using the following command: 
    aws configure
11. This will ask for a access key and secret access key. To access your AWS account from the CLI, you need to set up a user account associated with it and these keys are used for the authentication for accessing the AWS services.
12. Login to the AWS Management console and search for IAM
13. Navigate to Users and click on Create User
14. Give an appropriate user name and click Next
15. For the Permission options, choose the option 'Attach policies directly' and attach the 'AdministratorAccess' policy
    (Be careful while using the Administrator Access policy as we get the full access to the AWS services and is generally not recommended if the user will be accessed by someone else)
16. Navigate to the user created, and click on create Access key under the Access Keys option
17. Choose the CLI as the use case
18. Provide a suitable description about purpose of the Access key and Create Access Key
19. Securely store the Access key and Secret Access key (Some best practices while using Access Keys:)
    - Never store your access key in plain text, in a code repository, or in code.
    - Disable or delete access key when no longer needed.
    - Enable least-privilege permissions.
    - Rotate access keys regularly.
20. Return to the terminal or command prompt and paste the keys that were generated
21. Choose the region (Make sure the CLI default region and the S3 bucket region are the same)
22. Open preferred IDE and create a .py file for performing code
23. Open a terminal and install the libraries needed for this project
    pip install boto3
    pip install matplotlib
    If the previous code doesn't work, try using pip3 instead
24. Import necessary libraries. We need:
    - boto3 for interacting with AWS services
    - matplotlib for visualization
    - PIL (Python Imaging Library) for handling image data
    - BytesIO from the io module to work with image data
25. Add the following code to the .py file

## Link to Application