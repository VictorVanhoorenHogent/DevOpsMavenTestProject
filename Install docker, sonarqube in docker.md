-  Install docker, sonarqube in docker container, install maven, install trivy container scanning

-  install plugins in jenkins 

-  maak credentials in jenkins voor docker sonarqube

- pas de configuratie aan voor jenkins library en sonarqube installatie 

- run de pipeline scripts

- Install aws

- een policy maken om de aws zaken op te halen in de IAM console

```amazon
     {
                "Version": "2012-10-17",
                "Statement": [
                    {
                        "Action": [
                            "ecr:BatchCheckLayerAvailability",
                            "ecr:BatchGetImage",
                            "ecr:CompleteLayerUpload",
                            "ecr:GetDownloadUrlForLayer",
                            "ecr:InitiateLayerUpload",
                            "ecr:PutImage",
                            "ecr:UploadLayerPart"
                        ],
                        "Effect": "Allow",
                        "Resource": "arn:aws:ecr:*:450477592783:repository/victorwillem"
                    },
                    {
                        "Action": [
                            "ecr:GetAuthorizationToken"
                        ],
                        "Effect": "Allow",
                        "Resource": "*"
                    }

                ]
            }

```

- AWS rol aanmaken waar je de policy aan koppelt

- AWS rol koppelen aan de ec2 instance

- installing amazon ecr credential helper 

- export PATH=$PATH:/bin/docker-credential-ecr-login

- changing ~/var/lib/jenkins/.docker/config.json via de pipeline 
