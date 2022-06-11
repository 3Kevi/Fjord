local discordia = require("discordia")
local client = discordia.Client()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '.ping' then
		message:reply('Pong!')
	end
end)

client:on('messageCreate', function (message)
    if message.content == '.colors' then
        message:reply {
            embed = {
                title = "Name colours",
                description = "Here you can pick a fancy colour for your Discord name.",
                fields = {
                    {
                        name = "Available colours",
                        value = os.getenv("ROLES")
                    }
                },
                color = 0xf7d564
            }
        }
    end
end)

client:run("Bot "..os.getenv("BOT_TOKEN"))
