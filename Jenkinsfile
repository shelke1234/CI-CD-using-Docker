pipeline {
    agent any
	{
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://https://github.com/shelke1234/CI-CD-using-Docker.git'
             
	   }
        
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dhananjayshelke", url: "" ]) {
          sh  'docker push dhananjayshelke/samplewebapp:latest'
        //  sh  'docker push dhananjayshelke/samplewebapp:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 dhananjayshelke/samplewebapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@13.127.10.243 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            }
        }
    }
	}
    
