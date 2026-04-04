function aal --wraps='WEBKIT_DISABLE_COMPOSITING_MODE=1 arduino-app-lab & disown' --description 'alias aal=WEBKIT_DISABLE_COMPOSITING_MODE=1 arduino-app-lab & disown'
    WEBKIT_DISABLE_COMPOSITING_MODE=1 arduino-app-lab & disown $argv
end
