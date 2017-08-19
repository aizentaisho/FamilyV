description 'Scoreboard'

-- temporary!
ui_page 'html/scoreboard.html'
server_script {
'@mysql-async/lib/MySQL.lua',
'scoreboard_server.lua'
}
client_script 'scoreboard.lua'


files {
    'html/scoreboard.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js',
    'html/res/futurastd-medium.css',
    'html/res/futurastd-medium.eot',
    'html/res/futurastd-medium.woff',
    'html/res/futurastd-medium.ttf',
    'html/res/futurastd-medium.svg',
}