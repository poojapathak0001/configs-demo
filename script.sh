gcloud auth activate-service-account $GOOGLE_AUTH_EMAIL --key-file ./keyconfig.json --project $GOOGLE_PROJECT_ID

export PROJECT=$(gcloud info --format='value(config.project)')
gsutil mb gs://cdp-demo-205604-jenkins-artifacts

gs://cdp-demo-205604-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER
