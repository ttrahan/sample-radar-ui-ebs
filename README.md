# sample-radar-ui-ebs

This is the front-end of a simple app to demonstrate deploying a [Docker](www.docker.com) container on [AWS Elastic Beanstalk](aws.amazon.com/elasticbeanstalk) through Shippable. The app shows the age of Github issues and their status. To get the full functionality of the app, use the same steps to deploy the backend of the app which is also on ShippableSamples called [sample-radar-api-ebs](https://github.com/shippableSamples/sample-radar-ui-ebs).  

For the purpose of the demo, we will only be deploying the UI component (this repo) on EB.

By default, runs on port 3000

# Optional environment variables required for application:
- WWW_PORT: Port used for app (default:3000). Make sure the API gets the change accordingly.
- API_URL: URL for front end to find API (default:localhost:3001)
- API_PORT: Alternative to API_URL, port for front end to find API (default:3001)

# Environment variables required for deploying to Elastic Beanstalk
Before beginning, create a new application and environment in Elastic Beanstalk.
Follow the instructions [here](https://aws.amazon.com/elasticbeanstalk/getting-started/) to do so.

In the shippable.yml, change the following values based on your EB application:
- AWS_EB_APPLICATION:_yourElasticBeanstalkApplicationName_
- AWS_EB_ENVIRONMENT=_yourElasticBeanstalkEnvironmentName_
- AWS_S3_BUCKET=_yourS3BucketName_
- AWS_REGION=_yourPreferredAwsRegion_
- REGISTRY_ACCOUNT=_yourDockerRegistryAccount_  
  * Note that this can be the account/registry URL for any valid Docker Registry
- ACCOUNT_IDENTIFIER=shippable.$REGISTRY_ACCOUNT
  * No changes needed
- AWS_DEPLOY_JSON=Dockerrun.aws.json.$ACCOUNT_IDENTIFIER.$AWS_EB_APPLICATION
  * No changes needed
- AWS_DOCKER_CONFIG=dockerconfig.$ACCOUNT_IDENTIFIER.$AWS_EB_APPLICATION
  * No changes needed
