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
				
				sh 'chmod 777 script.sh'
				sh 'yes | ./script'
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
				}
			}
		}
	}
}