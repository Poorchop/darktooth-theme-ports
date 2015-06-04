#!/usr/bin/env bash
# Darktooth - Pantheon Terminal color scheme install script
# Jason Milkins (https://github.com/jasonm23)
# Charles B Johnson (https://github.com/charlesbjohnson)

SCHEMA="org.pantheon.terminal.settings"

gsettings set "$SCHEMA" background "#1D2021"
gsettings set "$SCHEMA" foreground "#A89984"
gsettings set "$SCHEMA" palette "#1D2021:#FB543F:#95C085:#FAC03B:#0D6678:#8F4673:#8BA59B:#A89984:#665C54:#FB543F:#95C085:#FAC03B:#0D6678:#8F4673:#8BA59B:#FDF4C1"
gsettings set "$SCHEMA" cursor-color "#32302F"

unset SCHEMA
