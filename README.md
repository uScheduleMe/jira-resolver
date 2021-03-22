# jira-resolver

Project created with [krait](http://tlia.ca/krait)

A bot to extract mentioned JIRA tickets from discord messages and reply to the message with a link to the tickets mentioned.

At this time this is done by simply getting something that resembles the tickets and attaching it to the end of a URL that acts as the base for the tickets. This means that this bot does not attempt to verify that the link is a ticket that does, indeed, exist. That functionality might be added later on with the JIRA api.


## Running the bot

First, add the required info in the .env file. You can see what variables are required in the .env.example file.

Then, run `make build` to build the docker image and `make run` to run it
