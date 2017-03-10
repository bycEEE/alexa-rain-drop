# Alexa Rain Drop

## Purpose:
Upon saying `[trigger word] rain drop`, the Amazon Echo will reply with `drop top`. Additionally upon asking her `are you bad and boujee`, she will recite additional lyrics from the song.

[![](https://i.imgur.com/bghWvaH.jpg)](https://streamable.com/7i348#)

## Prerequisites:
1. Install AWS CLI: [http://docs.aws.amazon.com/cli/latest/userguide/installing.html](http://docs.aws.amazon.com/cli/latest/userguide/installing.html).
2. Create an access key: [http://docs.aws.amazon.com/cli/latest/userguide/installing.html](https://aws.amazon.com/developers/access-keys/).
3. (To do: Add permissions info).
4. Fill in `~/.aws/credentials`.

    ```
    [default]
    region = us-east-1
    aws_access_key_id = 
    aws_secret_access_key = 
    ```

## How to Run:
1. Replace `BUCKET_NAME` in `config.env` with a unique bucket name.
2. Run the create script:

    ```
    ./start.sh
    ```

3. Create a new Alexa Skill: [https://developer.amazon.com/edw/home.html](https://developer.amazon.com/edw/home.html).
4. Click `Add a New Skill`.
5. Add `Rain Drop` as the name and invocation name.
    ![](https://i.imgur.com/Ul8yz2G.png)
6. Create a basic intent schema and sample utterances. Since we don't need to say anything past `rain drop`, we don't have to fill in any meaningful information.
    ![](https://i.imgur.com/TnVCh1z.png)

    ```
    {
      "intents": [
        {
          "intent": "SayRainDrop"
        }
      ]
    }
    ```

    ```
    SayRainDrop rain drop
    ```

7. Create another skill with `Bad and Boujee` as the name and `are you bad and boujee` as the invocation name.
    ![](https://i.imgur.com/N1S9jvV.png)
8. Use the same intent as the previous `Rain Drop` skill.
9. Select `AWS Lambda ARN (Amazon Resource Name)` and `North America`. Enter the ARN of your Lambda stack: `aws cloudformation describe-stacks --stack-name AlexaRainDropFunctions`.
10. All set!

Note to self: Add error handling to start script.
