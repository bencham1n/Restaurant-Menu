fx_version "cerulean"
game 'gta5'

lua54 'yes'

author 'bencham1n'
description 'Advanced Food System'


shared_scripts {
	"config.lua",
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',

}

client_scripts {
	'client/cmain.lua',
}

server_scripts {
	"server/smain.lua",
'@es_extended/imports.lua',

}

files {
    'locales/*.json'
  }
  




