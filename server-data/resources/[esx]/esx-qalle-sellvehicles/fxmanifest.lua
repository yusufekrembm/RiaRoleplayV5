fx_version 'adamant'

game 'gta5'

client_scripts {
    "config.lua",
    "client/main.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "config.lua",
    "server/main.lua"
}