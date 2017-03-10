# Alexa Rain Drop

## Purpose:
Upon saying "[trigger word] rain drop", the Amazon Echo will reply with "drop top".

## How to Run:
1. Replace `BUCKET_NAME` in `config.env` with a unique bucket name.
2. Source `config.env`

    ```
    source config.env
    ```

3. Run the create script:

    ```
    ./start.sh
    ```

4. Create a new Alexa Skill: [https://developer.amazon.com/edw/home.html](https://developer.amazon.com/edw/home.html)
5. Click 'Add a New Skill'
6. Add "Rain Drop" as the name and invocation name.
    ![](https://i.imgur.com/Ul8yz2G.png)
7. Create a basic intent schema and sample utterances. Since we don't need to say anything past "rain drop", we don't have to fill in any meaningful information.
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

8. Create another skill with `Bad and Boujee` as the name and `are you bad and boujee` as the invocation name.
    ![](https://i.imgur.com/N1S9jvV.png)
9. Use the same intent as the previous `Rain Drop` skill.
10. Select `AWS Lambda ARN (Amazon Resource Name)` and `North America`. Enter the ARN of your Lambda stack: `aws cloudformation describe-stacks --stack-name AlexaRainDropFunctions`.
11. All set!

Note to self: Add error handling to start script.
