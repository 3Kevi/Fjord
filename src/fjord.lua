local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	client:setGame('a game')
    print('Logged in as '.. client.user.username)
end)

local prefix = '.'

client:on('messageCreate', function(message)
    -- Ping
	if message.content == prefix..'ping' then
		message:reply {
            content = 'Pong!',
            reference = {message = message}
        }
    -- Pong
    elseif message.content == prefix..'pong' then
        message:reply {
            content = 'Ping!',
            reference = {message = message}
        }
    -- Name colours
    elseif message.content == prefix..'colors' then
        message:reply {
            embed = {
                title = 'Name colours',
                description = 'Here you can pick a fancy colour for your Discord name.',
                fields = {
                    {name = 'Available colours', value = os.getenv('ROLES')}
                },
                color = message.guild.me.highestRole.color
            },
            reference = {message = message}
        }
	end
end)

client:run('Bot '..os.getenv('BOT_TOKEN'))
