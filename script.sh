gcloud auth activate-service-account --key-file ./cdp-demo-d55fc085d0a7.json

export PROJECT=$(gcloud info --format='value(config.project)')
gsutil mb gs://cdp-demo-205604-jenkins-artifacts

mvn clean install test
gsutil cp /opt/bitnami/apps/jenkins/jenkins_home/workspace/pipeline-trial/target/exclude-resources-demo-0.0.1-SNAPSHOT.jar gs://cdp-demo-205604-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER/

gsutil acl get gs://cdp-demo-205604-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER/
