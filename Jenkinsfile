pipeline {
	agent any
	
	tools {
		maven 'Maven'
		jdk 'java8'
	}
	
	stages {
		stage ('Initialize') {
			steps {
				bat '''
					echo "Path = $Path"
					echo "M2_HOME = $M2_HOME"
				'''
			}
		}
		
		stage ('Build') {
			steps {
				sh 'mvn install'
			}
			
			post {
				success {
					junit 'exclude-resources-demo/target/surefire-reports/*.xml'
				}
			}
		}
	}
}