#!/bin/bash
echo
echo " ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗     ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗"
echo "██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██║████╗  ██║██╔════╝     ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝"
echo "██║     ██║     █████╗  ███████║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗    ███████╗██║     ██████╔╝██║██████╔╝   ██║   "
echo "██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██║██║╚██╗██║██║   ██║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   "
echo "╚██████╗███████╗███████╗██║  ██║██║ ╚████║██║██║ ╚████║╚██████╔╝    ███████║╚██████╗██║  ██║██║██║        ██║   "
echo " ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   "
echo 
echo "Package Manager"
echo "Pacman cache: $(du -sh /var/cache/pacman/pkg/ | cut -f1)"
echo "1. Clean Unused Cache"
echo "2. Clean All Cache"
echo "3. Skip"
echo "4. Exit"
echo
read -p "Choose an option: " option
case $option in
    1)
        sudo pacman -Sc
        ;;
    2)
        sudo pacman -Scc
        ;;
    3)
        ;;
    4)
        exit
        ;;
    *)
        echo "Invalid option"
        ;;
esac
echo 
echo "Unused Packages"
echo "Orphan packages: $(pacman -Qtdq | wc -l)"
pacman -Qtdq
echo
echo "1. Remove Unused Packages"
echo "2. Skip"
echo "3. Exit"
echo
read -p "Choose an option: " option
case $option in
    1)
        sudo pacman -Rns $(pacman -Qtdq)
        ;;
    2)
        ;;
    3)
        exit
        ;;
    *)
        echo "Invalid option"
        ;;
esac
echo
echo "Home Cache"
echo "Home cache: $(du -sh $HOME/.cache/ | cut -f1)"
echo "1. Clean All Cache"
echo "2. Skip"
echo "3. Exit"
echo
read -p "Choose an option: " option
case $option in
    1)
        rm -rf $HOME/.cache/*
        ;;
    2)
        ;;
    3)
        exit
        ;;
    *)
        echo "Invalid option"
        ;;
esac
echo
echo "Completed"
echo "---------"
