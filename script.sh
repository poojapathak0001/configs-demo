gcloud auth login

export PROJECT=$(gcloud info --format='value(config.project)')
gsutil mb gs://cdp-demo-205604-jenkins-artifacts

gs://cdp-demo-205604-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER
