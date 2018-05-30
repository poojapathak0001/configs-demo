gcloud auth activate-service-account poojapathak0001@gmail.com --key-file ./keyconfig.json --project cdp-demo-205604

export PROJECT=$(gcloud info --format='value(config.project)')
gsutil mb gs://cdp-demo-205604-jenkins-artifacts

gs://cdp-demo-205604-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER
