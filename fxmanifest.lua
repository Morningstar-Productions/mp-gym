fx_version 'cerulean'
game 'gta5'

name "mp-gym"
description "Gym Workout Script rewritten from dynyx-gym to account for ox_lib and Qbox"
author "Green & xViperAG"
version "1.0.0"

lua54 'yes'

shared_scripts { '@ox_lib/init.lua', '@Renewed-Lib/init.lua' }

client_scripts { 'client/*.lua' }

server_scripts { 'server/*.lua' }

files { 'config/shared.lua' }
