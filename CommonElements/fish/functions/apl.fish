function apl --wraps='env WEBKIT_DISABLE_COMPOSITING_MODE=1 arduino-app-lab & disown' --description 'alias apl=env WEBKIT_DISABLE_COMPOSITING_MODE=1 arduino-app-lab & disown'
    env WEBKIT_DISABLE_COMPOSITING_MODE=1 arduino-app-lab & disown $argv
end
