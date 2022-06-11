local discordia = require("discordia")
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

local prefix = "."

client:on('messageCreate', function(message)
	if message.content == prefix .. 'ping' then
		message:reply {
            content = 'Pong!',
            reference = {
                message = message,
                mention = false
            }
        }
    elseif message.content == prefix .. "pong" then
        message:reply {
            content = "Ping!",
            reference = {
                message = message,
                mention = false
            }
        }
	end
end)

client:on('messageCreate', function (message)
    if message.content == prefix .. 'colors' then
        message:reply {
            embed = {
                title = "Name colours",
                description = "Here you can pick a fancy colour for your Discord name.",
                fields = {
                    {
                        name = "Available colours",
                        value = "<@&895301576242135080>\n<@&960423013470326814>\n<@&895301625374212166>\n<@&895301727249641472>\n<@&926936491941298237>\n<@&895301819763392563>\n<@&895681926659178606>\n<@&895301965003759647>\n<@&895302075775332372>\n<@&895302177168457758>\n<@&895302133035991060>\n<@&895302320609439744>\n<@&901409592079171595>\n<@&895302374460112966>\n<@&895302484002758769>\n<@&895302544346210304>\n<@&895302613690630195>\n<@&895302674071822347>\n<@&895302733152804865>\n<@&895302776815497236>"
                    }
                },
                color = 0xf7d564
            },
            reference = {
                message = message,
                mention = false
            }
        }
    end
end)

client:run("Bot "..os.getenv("BOT_TOKEN"))
