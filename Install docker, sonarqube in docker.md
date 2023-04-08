-  Install docker, sonarqube in docker container, install maven, install trivy container scanning

-  install plugins in jenkins 

-  maak credentials in jenkins voor docker sonarqube

- pas de configuratie aan voor jenkins library en sonarqube installatie 

- run de pipeline scripts

- Install aws

- Configure aws met de juiste waarden die je vindt bij de AWS IAM user (access key, secret key ...)

- IAM user aanmaken zodat er gebruik kan worden gemaakt van aws console

- Dan een policy koppelen aan de user zodat gij het wachtwoord kan opvragen

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

aws key: AKIAWRYUOSDHZN4MVFDM
aws secret key: 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

