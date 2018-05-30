gcloud auth activate-service-account --key-file ./cdp-demo-d55fc085d0a7.json

export PROJECT=$(gcloud info --format='value(config.project)')

gs://cdp-demo-205604-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER
