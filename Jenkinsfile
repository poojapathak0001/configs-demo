pipeline {
	agent any
	
	tools {
		maven 'Maven'
		jdk 'java8'
	}
	
	stages {
		stage ('Initialize') {
			steps {
				
				sh	'echo "Path = $Path"'
				sh	'echo "M2_HOME = $M2_HOME"'
				
			}
		}
		
		stage ('Build') {
			steps {
				sh 'mvn clean install'
			}
			
			post {
				success {
					junit 'exclude-resources-demo/target/surefire-reports/*.xml'
				}
			}
		}
	}
}