FROM python:3-slim

WORKDIR /app

RUN python3 -m pip install python-dotenv discord.py

COPY . /app

COPY ./.env /app

RUN python3 -m pip install .

CMD ["jira-resolver"]
