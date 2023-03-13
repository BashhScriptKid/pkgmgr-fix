# puts it as a function so it can be easily executed by other files.
scan_aur(){
    if [ $AURASK = y ]; then
        # readies the var for aur helper url
        export $AUR_FUNC_DL_URL_PKGMGRFIX=$DL_URL_PKGMGRFIX/pacaur_func

        if [ -a $PATH/auracle ]; then

        fi

        if [ -a $PATH/pbget ]; then

        fi

        if [ -a $PATH/repoctl ]; then

        fi

        if [ -a $PATH/yaah ]; then

        fi

        if [ -a $PATH/aurutils ]; then

        fi

        if [ -a $PATH/bauerbill ]; then

        fi

        if [ -a $PATH/pkgbuilder ]; then

        fi

        if [ -a $PATH/rua ]; then

        fi

        if [ -a $PATH/aura ]; then

        fi

        if [ -a $PATH/pacaur ]; then

        fi

        if [ -a $PATH/pakku ]; then

        fi

        if [ -a $PATH/paru ]; then

        fi

        if [ -a $PATH/pikaur ]; then

        fi

        if [ -a $PATH/trizen ]; then

        fi

        if [ -a $PATH/yay ]; then

        fi

        if [ i = 0 ]; then
            echo "No AUR helpers installed. Refer to https://wiki.archlinux.org/title/AUR_helpers for list of helpers to install one."
        else
            echo "$i AUR helpers found."
        fi

    elif [ $AURASK = n ]; then
        exit
    fi
}

# calls the function if the script is executed directly
scan_aur()