#! /bin/bash

ags quit >> /dev/null

sleep 0.5

ags run ~/.config/ags/app.ts & disown