#!/bin/sh
chmod +x install_scripts.sh;
chmod +x script.sh;
chmod +x install_scripts/anonsurf_install.sh;
chmod +x install_scripts/kalitorify_install.sh;
chmod +x install_scripts/tor_install.sh;
chmod +x install_scripts/torghost_install.sh;
chmod +x install_scripts/torphantom_install.sh;

show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Install anonimity services ${normal}\n"
    printf "${menu}**${number} 2)${menu} Run anonimity services ${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter or ${fgred}x to exit. ${normal}"
    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            option_picked "Install apps";
            sudo ./install_scripts.sh;
            show_menu;
        ;;
        2) clear;
            option_picked "Run apps";
            sudo ./script.sh;
            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done
