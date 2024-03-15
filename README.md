*Creating an Instance on AWS was the first prodecure and connected to the instance, AWS is quite faster and than my local machine so i used the service provider.
In the file uploaded there are two folders and three files, the first three files are "Jenkinsfile", "cluster-Jenkinsfile", "installer.sh".
- The installer.sh is file that contains codes that will upgrade ubuntu because ubuntu is the AMI that was used, update and install terraform because terraform is the IaaC that's being used, installing awscli, because i used the AWS cli rather than my local machine and allowed AWS to be able to access my IAM profile.
- The installer.sh also installs, updates, and start Jenkins so that it can be enabled on the public-IP address that was auto assigned by AWS using the port:8080.

* The cluster-Jenkins file allows Jenkins to be able to access our git repository and AWS account one a cluster is created and can alos be destroyed.

* The Jenkinsfile also allows Jenkins to access our git repository and AWS in other to access the Access-ID and Secret key so it can create the prometheus, deploy the sock-shop, also deploy the ingress-rule to connect with the AWS eks and finally creating the nginx and Route53 which allows us to be able to get access to the grafana and sock-shop domain. It also requests for certification from Amazon, and it fails sometimes because of the longer period for AWS to issue certification. And we can destroy and pipeline with this file on Jenkins as well. 

*The EKS folder consists of several files such as "eks.auto.tfvars", "terraform.tfvars", "vpc.auto.tfvars". All these are terraform files used to create clusters and vpc using the AWS CLI and it can also be destroyed using the AWS CLI as well.

*The kubernetes folder has several folders and files such as "ingress-rule", "micro-service", "nginx-controller". All these files help configure kubernetes on AWS.

Finally after using Jenkins pipeline to deploy the prometheus and other necesarry files, AWS certification took a longer time to issue certificate. Also both the sock-shop and grafana couldn't be secured because of the certificate.
Also had to take a screenshot for it to show my domain name which is "afolabiibikunle.com.ng"
* Jenkins was used to destroy all resources.
