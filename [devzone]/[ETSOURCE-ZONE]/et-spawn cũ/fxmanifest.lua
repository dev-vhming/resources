fx_version 'cerulean'
game 'gta5'

description 'et-Spawn'
version '1.0.0'

shared_scripts {
	'config.lua',
	'@et-houses/config.lua',
	'@et-apartments/config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/script.js',
	'html/reset.css'
}

lua54 'yes'