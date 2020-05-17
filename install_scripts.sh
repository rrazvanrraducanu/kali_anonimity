#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Install Tor service ${normal}\n"
    printf "${menu}**${number} 2)${menu} Install Kalitorify ${normal}\n"
    printf "${menu}**${number} 3)${menu} Install TorGhost ${normal}\n"
    printf "${menu}**${number} 4)${menu} Install TorPhantom ${normal}\n"
    printf "${menu}**${number} 5)${menu} Install Anonsurf ${normal}\n"
    printf "${menu}**${number} 6)${menu} Install Proxychains ${normal}\n"   
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
            option_picked "Install Tor service";
            sudo ./install_scripts/tor_install.sh;
            show_menu;
        ;;
        2) clear;
            option_picked "Install Kalitorify";
            sudo ./install_scripts/kalitorify_install.sh;
            show_menu;
        ;;
        3) clear;
            option_picked "Install TorGhost";
            sudo ./install_scripts/torghost_install.sh;
            show_menu;
        ;;
        4) clear;
            option_picked "Install TorPhantom";
            sudo ./install_scripts/torphantom_install.sh;
            show_menu;
        ;;
         5) clear;
            option_picked "Install Anonsurf";
            sudo ./install_scripts/anonsurf_install.sh;
            show_menu;
        ;;
        6) clear;
            option_picked "Install proxychains";
            sudo apt-get install proxychains;
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
