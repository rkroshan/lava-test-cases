pipeline {
   agent { label 'lava-jenkin' }

   stages {
      stage('Init') {
         steps {
             sh """
             #!/bin/bash
             echo "Connection Success"
	     ls -la	
             """
            
         }
      }
      stage('Build'){
          steps{
               sh """
          #!/bin/bash
          echo 'submitting job to lava-server'
          export job_id=`lavacli -i testing jobs submit stress-ng-ssh-basic-job-definition.yaml`
          echo "sumitted job id : \$job_id"
          sleep 30
          lavacli -i testing jobs wait --polling 240 \$job_id
          rm -rf job.properties
          echo "job_id : \$job_id" >> job.properties
          """
          }
         
      }
      stage('Result'){
          steps {
          sh """
          #!/bin/bash
          job_id=`cat job.properties | cut -d ":" -f 2`
          lavacli -i testing jobs show \$job_id
          """
          }
      }
   }
}

