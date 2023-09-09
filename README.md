# Cloud Infrastructure Engineer
## Take-home technical assessment

## Introduction
The purpose of this assessment is for **sisu-tech** to ascertain the technical suitability of candidates applying for a Cloud Infrastructure Engineer position.

Please note the following:

 - Use any tools that you think are relevant to the tasks. We have added context around the tools currently in use at sisu-tech (indicated on each task with the :arrow_forward: emoji) but if you are inexperienced with these, please use an alternative that you're comfortable with (e.g. AWS CDK instead of Terraform)
 - We do not expect this test to take more than 2 hours
 - We recommend to create a new account in Google Cloud Platform (GCP) for testing the results.

## Process

 1. Complete the tasks listed below
 2. Edit this `README.md` file to include brief answers to the questions about the assessment listed below
 3. Push your work to your new repository
 4. Send your recruitment contact a link to the new repository

If you have any questions about this process, please speak to your recruitment contact.

## Tasks

### 1. Docker
A basic TypeScript application has been created in the `application` folder. Create a Dockerfile to build this application, making sure that it runs on your local device.

answer: checkout the dockerfile

### 2. CI/CD
 - :arrow_forward: Github Actions 
 - :arrow_forward: Argo Workflows

Write a YAML-based or Kubernetes-based CI/CD pipeline to build, push and deploy this docker image to some Google Kubernetes Engine cluster.

Create Kubernetes resource definitions needed to deploy the application and include it in the `kubernetes` folder.

Use whatever mechanism/tools you think are appropriate/relevant to deploy the application.

NOTE: This pipeline does not have to be fully active. All we're looking for is the YAML file. Minor syntax errors will be overlooked.

answer : checkout the `application.yaml` and `.github/workflows/cicd.yaml` files

### 3. Infrastructure as Code
 - :arrow_forward: Terraform CDK in TypeScript

Create some Infrastructure as Code resources to deploy an Google Cloud Kubernetes Engine and an Cloud SQL database to some Google Cloud account.

The Google Cloud Kubernetes Engine must be able to connect to Google Cloud SQL, and the Kubernetes Cluster will need to be accessed as follows:
 - VPN from IPs `10.26.32.12` and `19.104.105.29`
 - HTTPS traffic from anywhere

Consider other general security best practices.

Other configuration can be decided by yourself, based on the instance being used for a low resource usage, low traffic web application.

answer: 
all terraform files are in `core-resources/` folder , to run this you have to login to your gcp account and create a project first
then you can run terraform apply to run all resources in your project this part i assume is not needed to provide detail so won't paste the steps here

## Questions

 1. How long did you spend on this assessment in total?\
around 2 hr in total or maybe a bit more

 2. What was the most difficult task?\
 having gcp setup was new for me so it took me a while to get things working

 3. If you had an unlimited amount of time to complete this task, what would you have done differently?\
- modulize my terraform code and have the code written according to best practice, use more parameters 
- use some storage backend for state files
- gke setup would have more features enabled and actually install argocd
- use encrypted var setup for db users
- use atrifactory instead of container registery



####
my questions:

VPN from IPs `10.26.32.12` and `19.104.105.29` ? what does this line mean ? you mean to be able to reach to cluster and everything from these two src ips ?
HTTPS traffic from anywhere - only https? why not http and https and handle the "https only" with a redirect

cluster is in a private vpc so no outside party can actually directly connect to the cluster at the moment
