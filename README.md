# Amazon Web Service Cloudformation Templates
Deployment of re-usable cloudformation templates that can be used as AWS::CloudFormation::Stack resources.

## Requisites
The following software is needed to execute the deployment to AWS:

* [Python](https://www.python.org/) proven with 2.7.13.
* [Ansible](https://www.ansible.com/), proven with 2.2.0.0 version.
* [Boto](http://boto.cloudhackers.com/en/latest/) library, proven with 2.43.0 version.

## Execution
Execute the following via the command line (assumes you are in the root directory of the project) to deploy cloudformations to AWS S3 bucket:
````
./deploy.sh
````
Execute the following via the command line (assumes you are in the root directory of the project) to undeploy cloudformations from AWS S3 bucket:
````
./undeploy.sh
````
