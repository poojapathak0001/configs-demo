pipeline {
	agent any
	
	parameters {
        string(name: 'Greeting', defaultValue: 'Hello', description: 'How should I greet the world?')
    }
	
	tools {
		maven 'Maven'
		jdk 'java8'
	}
	
	stages {
		stage ('Initialize') {
			steps {
				
				sh	'echo "Path = $Path"'
				sh	'echo "M2_HOME = $MAVEN_HOME"'
				
			}
		}
		
		stage ('Build') {
			steps {
				sh 'mvn clean install test'
				echo "${params.Greeting} World!"
			}
			
			post {
				success {
					junit 'target/surefire-reports/*.xml'
					gsutil gs://cdp-demo-205604-jenkins-artifacts/$JOB_NAME/$BUILD_NUMBER
				}
			}
		}
	}
}