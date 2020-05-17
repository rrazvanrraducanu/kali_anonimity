#!/bin/sh
show_menu(){
    normal=`echo "\033[m"`
    menu=`echo "\033[36m"` #Blue
    number=`echo "\033[33m"` #yellow
    bgred=`echo "\033[41m"`
    fgred=`echo "\033[31m"`
    printf "\n${menu}*********************************************${normal}\n"
    printf "${menu}**${number} 1)${menu} Start Tor service ${normal}\n"
    printf "${menu}**${number} 2)${menu} Stop Tor service ${normal}\n"
    printf "${menu}**${number} 3)${menu} Tor status ${normal}\n"

    printf "************************************\n"

    printf "${menu}**${number} 4)${menu} Start Kalitorify ${normal}\n"
    printf "${menu}**${number} 5)${menu} Stop Kalitorify ${normal}\n"
    printf "${menu}**${number} 6)${menu} Kalitorify status ${normal}\n"

    printf "*************************************\n"

    printf "${menu}**${number} 7)${menu} Start TorGhost ${normal}\n"
    printf "${menu}**${number} 8)${menu} Stop TorGhost ${normal}\n"

    printf "*************************************\n"

    printf "${menu}**${number} 9)${menu} Start TorPhantom ${normal}\n"
    printf "${menu}**${number} 10)${menu} Stop TorPhantom ${normal}\n"

    printf "*************************************\n"
 
    printf "${menu}**${number} 11)${menu} Start Anonsurf ${normal}\n"
    printf "${menu}**${number} 12)${menu} Stop Anonsurf ${normal}\n"
    printf "${menu}**${number} 13)${menu} Anonsurf status ${normal}\n"

    printf "*************************************\n"

    printf "${menu}**${number} 14)${menu} Show external IP ${normal}\n"


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
            option_picked "sudo tor start";
            sudo service tor start;
            show_menu;
        ;;
        2) clear;
            option_picked "sudo tor stop";
            sudo service tor stop;
            show_menu;
        ;;
        3) clear;
            option_picked "sudo tor status";
            sudo service tor status;
            show_menu;
        ;;
        4) clear;
            option_picked "sudo kalitorify -t";
            sudo kalitorify -t;
            show_menu;
        ;;
        5) clear; 
            option_picked "sudo kalitorify -c";
            sudo kalitorify -c;
            show_menu;
        ;;
        6) clear; 
            option_picked "sudo kalitorify -s";
            sudo kalitorify -s;
            show_menu;
        ;;
         7) clear; 
            option_picked "sudo torghost -s";
            sudo torghost -s;
            show_menu;
        ;;
        8) clear; 
            option_picked "sudo torghost -x";
            sudo torghost -x;
            show_menu;
        ;;
        9) clear; 
            option_picked "sudo torphantom start";
            sudo torphantom start;
            show_menu;
        ;;
        10) clear; 
            option_picked "sudo torphantom stop";
            sudo torphantom stop;
            show_menu;
        ;;
         11) clear; 
            option_picked "sudo anonsurf start";
            sudo anonsurf start;
            show_menu;
        ;;
         12) clear; 
            option_picked "sudo anonsurf stop";
            sudo anonsurf stop;
            show_menu;
        ;;
         13) clear; 
            option_picked "sudo anonsurf status";
            sudo anonsurf status;
            show_menu;
        ;;

         14) clear; 
            option_picked "show external IP";
            printf "sudo echo $(wget -qO - https://api.ipify.org)";
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
