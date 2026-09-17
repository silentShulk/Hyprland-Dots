import QtQuick

import "../../Data"
import "../Components"
import "../../Theme"

TopBarIsland {
    id: power

    square: true
    
    color: Colors.accent1

    icon: "settings_power"
    
    iconBackground: false
    iconColor: Colors.fg
    iconFontSizeMultiplier: 2

    onBadgeClicked: Loaders.logoutMenuLoader.active = !Loaders.logoutMenuLoader.active}