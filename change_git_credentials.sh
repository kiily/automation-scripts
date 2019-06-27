#!/bin/zsh

source ./utils/echo_utils.sh

echo_title "CHANGING GIT CREDENTIALS"

local credentials_dialog=(dialog --backtitle "Changing git credentials" \
                --title "Select the credentials to set" --clear --no-tags \
                --menu "This will set the global git credentials" 20 50 15)
    local credentials_options=( 
        "perso" "PERSONAL (kiily)"
        "work" "WORK (miguelyoobic95)"
        "custom" "CUSTOM"
    )

    credentials_choice="$("${credentials_dialog[@]}" "${credentials_options[@]}" 2>&1 >/dev/tty)"

if ([[ $credentials_choice == *"perso"* ]]); then
    git config --global user.name kiily
    git config --global user.email miguelmarin95@hotmail.com
    echo_color "Set to PERSONAL (killy)" $color_green
fi

if ([[ $credentials_choice == *"work"* ]]); then
    git config --global user.name miguelyoobic95
    git config --global user.email mmarin@yoobic.com
    echo_color "Set to WORK (miguelyoobic95)" $color_green
fi

if ([[ $credentials_choice == *"custom"* ]]); then
    echo_color "Please enter your user name at Github:"
    read username < /dev/tty
    echo_color "Please enter your email at Github:"
    read email < /dev/tty
    git config --global user.name $username
    git config --global user.email $email
    echo_color "Set to CUSTOM" $color_green
fi

echo_color "CREDENTIALS SET" $color_green

git config --global user.name
git config --global user.email

