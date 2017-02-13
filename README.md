# Alexa Rain Drop

## Purpose:
Upon saying "[trigger word] rain drop", the Amazon Echo will reply with "drop top".

## How to run:
Install AWS permissions
Create access key/secret
Install aws cli
Launch cfn stack
Configure Alexa Skills

1. Create a new Alexa Skill: [https://developer.amazon.com/edw/home.html](https://developer.amazon.com/edw/home.html)
2. Click 'Add a New Skill'
3. Add "Rain Drop" as the name and invocation name.
![](https://i.imgur.com/Ul8yz2G.png)
4. Create a basic intent schema and sample utterances. Since we don't need to say anything past "rain drop", we don't have to fill in any meaningful information.
![](https://i.imgur.com/TnVCh1z.png)
5. Select "AWS Lambda ARN (Amazon Resource Name)" and "North America". Enter the ARN of your Lambda stack: `aws cloudformation describe-stacks --stack-name AlexaRainDrop`
6. All set!
