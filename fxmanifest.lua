-------------------------------------
--- CONVERTIDO POR : Dogz1m#4597 ----
------------------------------------- 

fx_version 'cerulean'
games {'gta5'}
lua54 "yes"

author 'T1GER#9080'
discord 'https://discord.gg/FdHkq5q'
description 'T1GER Truck Robbery'
version '1.0.0'

client_scripts {
	"@vrp/lib/utils.lua",
	'language.lua',
	'config.lua',
	'client/main.lua',
	'client/utils.lua'
}

server_scripts {
	"@vrp/lib/utils.lua",
	'@mysql-async/lib/MySQL.lua',
	'language.lua',
	'config.lua',
	'server/main.lua'
}

escrow_ignore {
    "config.lua",
    "language.lua",
    "client/*.lua",
    "server/*.lua",
}