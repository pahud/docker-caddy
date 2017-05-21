#!/bin/bash

az=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
region=${az%%[a-z]}

YourName=`aws --region ${region} ssm get-parameters --names ECSYourName --query 'Parameters[0].Value' --output text 2>/dev/null` 

if [ -z ${YourName} ]; then 
	YourName="##Undefinied##"
fi

cat > /srv/greeting.html <<EOF
<!DOCTYPE html>
<html>
<head>
<title>EC2 Parameter Store demo</title>
</head>
<body>
<h1>Hi ${YourName}!</h1>
EOF

/usr/bin/caddy --conf /etc/Caddyfile --log stdout
