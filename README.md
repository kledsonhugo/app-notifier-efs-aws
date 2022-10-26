# PHP app with EFS, RDS and SNS

Sample PHP WebApp to store contact info.

The app uses [AWS EFS](https://aws.amazon.com/efs/) to store the app code, [AWS RDS](https://aws.amazon.com/rds/) to store all contact info in a database and [AWS SNS](https://aws.amazon.com/sns/) to send SMS notifications to the user cell phone.<br><br>

## Target architecture

![Notifier](/images/target_architecture.png)<br><br>