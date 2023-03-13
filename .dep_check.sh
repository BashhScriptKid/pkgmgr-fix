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

# looks for any available package manager and downloads the necessary file afterwards
if [ -a $PATH/apt ]; then
    echo "Detected package manager: APT Ubuntu-based system"
    echo "DPKG will be included. Please use the -dpkg to troubleshoot it."
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $FUNC_DL_URL_PKGMGRFIX/apt_func.sh
        git clone $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $FUNC_DL_URL_PKGMGRFIX/apt_func.sh
        wget $FUNC_DL_URL_PKGMGRFIX/dpkg_func.sh
    fi
elif [ -a $PATH/apt-get ]; then
    echo "Detected package manager: APT-GET Debian-based systems"
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
    fi
    read -p 'Include AUR helpers? y/n' AURASK
    # grabs function from a file and calls it
    source /usr/share/pkgmgr-fix/aurscan.sh
    scan_aur
    fi

    