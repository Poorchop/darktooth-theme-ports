#!/usr/bin/env bash
# Darktooth - Mate Terminal color scheme install script
# Jason Milkins (https://github.com/jasonm23)

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Base 16 Darktooth Dark"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="base-16-darktooth-dark"
[[ -z "$DCONFTOOL" ]] && DCONFTOOL=dconf
[[ -z "$BASE_KEY" ]] && BASE_KEY=/org/mate/terminal/profiles

PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

dset() {
  local key="$1"; shift
  local val="$1"; shift

  "$DCONFTOOL" write "$PROFILE_KEY/$key" "$val"
}

# Because gconftool doesn't have "append"
glist_append() {
  local key="$1"; shift
  local val="$1"; shift

  local entries="$(
    {
      "$DCONFTOOL" read "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
      echo "'$val'"
    } | head -c-1 | tr "\n" ,
  )"

  "$DCONFTOOL" write "$key" "[$entries]"
}

# Append the Base16 profile to the profile list
glist_append /org/mate/terminal/global/profile-list "$PROFILE_SLUG"

dset visible-name "'$PROFILE_NAME'"
dset palette "'#1D2021:#FB543F:#95C085:#FAC03B:#0D6678:#8F4673:#8BA59B:#A89984:#665C54:#FB543F:#95C085:#FAC03B:#0D6678:#8F4673:#8BA59B:#FDF4C1'"
dset background-color "'#1D2021'"
dset foreground-color "'#A89984'"
dset bold-color "'#A89984'"
dset bold-color-same-as-fg "true"
dset use-theme-colors "false"
dset use-theme-background "false"
