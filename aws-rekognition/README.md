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

    import boto3
    import matplotlib.pyplot as plt
    import matplotlib.patches as patches
    from PIL import Image
    from io import BytesIO

    def detect_labels(photo, bucket):
        client = boto3.client('rekognition')

        response = client.detect_labels(
            Image={'S3Object': {'Bucket': bucket, 'Name': photo}},
            MaxLabels=10)

        print('Detected labels for ' + photo) 
        print()   

        # Print label information
        for label in response['Labels']:
            print("Label:", label['Name'])
            print("Confidence:", label['Confidence'])
            print()

        # Load the image from S3
        s3 = boto3.resource('s3')
        obj = s3.Object(bucket, photo)
        img_data = obj.get()['Body'].read()
        img = Image.open(BytesIO(img_data))

        # Display the image
        plt.imshow(img)
        ax = plt.gca()

        # Plot bounding boxes
        for label in response['Labels']:
            for instance in label.get('Instances', []):
                bbox = instance['BoundingBox']
                left = bbox['Left'] * img.width
                top = bbox['Top'] * img.height
                width = bbox['Width'] * img.width
                height = bbox['Height'] * img.height

                rect = patches.Rectangle((left, top), width, height, linewidth=1, edgecolor='r', facecolor='none')
                ax.add_patch(rect)

                label_text = label['Name'] + ' (' + str(round(label['Confidence'], 2)) + '%)'
                plt.text(left, top - 2, label_text, color='r', fontsize=8, bbox=dict(facecolor='white', alpha=0.7))

        plt.show()

        return len(response['Labels'])

    def main():
        photo = 'image_file_name'
        bucket = 'bucket_name'
        label_count = detect_labels(photo, bucket)
        print("Labels detected:", label_count)

    if __name__ == "__main__":
        main()
26. The function called detect_labels takes a photo and bucket name as input parameters. Within the function: 
 - We create Rekognition client using boto3
 - We use the detect_labels method of the Rekognition client to detect labels in the given photo
 - We print the detected labels along with their confidence levels
 - We load the image from the S3 bucket using boto3 and PIL
 - We use matplotlib to display the image and draw bounding boxes around the detected objects
27. The main function is used to test the detect_labels function. Specifying the sample photo and bucket name, then call the detect_labels function within these parameters. (Remember to change your ‘image_file_name’ and ‘bucket_name’ to your actual configured naming.)

## Conclusion
Congratulations on completing the Image Label Generator project using AWS Rekognition. You've done an excellent job.

If you enjoyed working on this project and want to explore more functionalities or ideas to expand it further, here are some recommendations for you:

Adding Video Label Detection:
Extend your project to support video label detection. You can use AWS Rekognition's video analysis capabilities to analyze videos and detect labels in each frame.
This could be useful for applications like video content moderation or surveillance

Adding Real-Time Object Label Detection:
Enhance your project to support real-time object label detection using live camera feeds. You can use libraries like OpenCV to capture video frames from a webcam and then use AWS Rekognition to detect objects in real-time.

Analyzing Facial Expressions:
Explore AWS Rekognition's facial analysis capabilities to analyze facial expressions in images or videos.
You can detect emotions like happiness, sadness, anger, etc., and use this information for various applications such as sentiment analysis, user feedback analysis, or personalized marketing.

Identifying Faces:
Expand your project to include face recognition capabilities.
AWS Rekognition offers face recognition APIs that allow you to detect and recognize faces in images or videos.
You can use this feature for applications like user authentication, access control, or personalized recommendations.
Have fun experimenting and building new features for your project

## Clean-up
Login to the AWS Management Console and go to S3 using the search bar. Select the S3 bucket created for this project and choose the ‘Delete’ option located in the top right corner of the general-purpose buckets section.

Next, navigate to Lambda from the search bar. Select the Lambda function created for this project and go to ‘Actions’ → ‘Delete’ option available in the top right corner.

Lastly, navigate to IAM from the search bar. Select the User created to grant CLI access and choose the ‘Delete’ option provided in the top right corner.

## Link to Application