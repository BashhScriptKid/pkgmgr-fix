## Looks for program to call the file from the github repository (wget, git). If not available, stop proceeding

if [ ! -a $PATH/bash ]; then
    echo "Bash needs to be installed to proceed. Process will exit with code 1."
    exit 1
else;
    echo "Checking for required programs..."
    if [ -a $PATH/git ] && [ -a $PATH/wget ]; then
        echo "Git and wget found, preferring git."
        export DL_PKGMGRFIX='git'
    elif [ ! -a $PATH/git ] && [ -a $PATH/wget ]; then
        echo "wget found, proceeding."
        export DL_PKGMGRFIX='wget'
    elif [ -a $PATH/git ] && [ ! -a $PATH/wget ]; then
        echo "Git found. proceeding.."
        export DL_PKGMGRFIX='git'
    else
        if [ ! -a $PATH/wget ] && [ ! -a $PATH/wget ]; then
            echo "One or more required program is not installed. This script requires; Bash, Git or wget (to import necessary function)"
        fi
    fi
fi


## Checks for user's installed package manager,then downloads the necessary function source

# sets the beginning of an url to a variable
export DL_URL_PKGMGRFIX=https://github.com/Hafizat/pkgmgr-fix

# sets a link to fetch the function files
export FUNC_DL_URL_PKGMGRFIX=$DL_URL_PKGMGRFIX/func_call

if [ -a $PATH/apt ]; then
    echo "Detected package manager: APT"
    echo "DPKG will be included. Please use the -dpkg to troubleshoot it."
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $FUNC_DL_URL_PKGMGRFIX/apt_func.sh
        git clone $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $FUNC_DL_URL_PKGMGRFIX/apt_func.sh
        wget $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    fi
elif [ -a $PATH/apt-get ]; then
    echo "Detected package manager: APT-GET"
    echo "DPKG will be available to troubleshoot via executing it with -dpkg"
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $FUNC_DL_URL_PKGMGRFIX/apt-get_func.sh
        git clone $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $FUNC_DL_URL_PKGMGRFIX/apt-get_func.sh
        wget $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    fi
elif [ ! -a $PATH/apt ] && [ ! -a $PATH/apt-get ] && [ ! -a $PATH/dpkg ]; then
    echo "Neither apt or apt-get was installed, yet dpkg is installed. Proceeding..."
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    fi
elif [ -a $PATH/yum ]; then
    echo "Detected package manager: RedHat yum"
    if [ $DL_PKGMGRFIX = git ]; then
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $FUNC_DL_URL_PKGMGRFIX/yum_func.sh
    fi
elif [ -a $PATH/pacman ]; then
    echo "Detected package manager: Arch pacman"
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $FUNC_DL_URL_PKGMGRFIX/pacman_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $FUNC_DL_URL_PKGMGRFIX/pacman_func.sh
    read -p 'Include AUR helpers? y/n' AURASK
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

    