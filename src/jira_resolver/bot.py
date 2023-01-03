import discord  # type: ignore
from discord.ext import commands  # type: ignore

import jira_resolver.config as cfg


intents = discord.Intents()
intents.guild_messages = True

bot = commands.Bot(
    command_prefix="!",
    description="""
    A bot to post the links to tickets that are mentioned in-line
    in discord messages
    """,
    intents=intents,
)


@bot.event
async def on_ready():
    pass


@bot.event
async def on_command_error(ctx, error):
    await ctx.send(error)


@bot.event
async def on_message(msg: discord.Message):
    if bot.user is None:
        raise Exception("Bot user is None")

    if msg.author.id == bot.user.id:
        return

    if cfg.ticket_regex.search(msg.content):
        matches = cfg.ticket_regex.findall(msg.content)
        links: list[str] = []

        for ticket in matches:
            links.append(f"<{cfg.jira_prefix}{ticket}>")

        await msg.reply("\n".join(links))


def main():
    bot.run(cfg.discord_token)


if __name__ == "__main__":
    main()
