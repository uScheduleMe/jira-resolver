import re
import os

from dotenv import load_dotenv

import logging


load_dotenv()

ticket_regex = re.compile(r'\[([A-Z][A-Z]-\d+)\]')
jira_prefix = os.getenv('JIRA_PREFIX')
discord_token = os.getenv('DISCORD_TOKEN')
logger = logging.getLogger('discord')
logger.setLevel(logging.DEBUG)
handler = logging.StreamHandler()
# handler = logging.FileHandler(
#     filename='discord.log',
#     encoding='utf-8',
#     mode='w'
# )
handler.setFormatter(logging.Formatter(
    '%(asctime)s:%(levelname)s:%(name)s: %(message)s'
))
logger.addHandler(handler)
