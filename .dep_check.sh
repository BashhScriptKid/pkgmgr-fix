## Looks for program to call the file from the github repository (wget, git). If not available, stop proceeding

if [ ! -a /bin/bash ]; then
    echo "Bash needs to be installed to proceed. Process will exit with code 1."
    exit 1
else;
    echo "Checking for required programs..."
    if [ -a /usr/bin/git ] && [ -a /bin/wget ]; then
        echo "Git and wget found, preferring git."
        export DL_PKGMGRFIX='git'
    elif [ ! -a /usr/bin/git ] && [ -a /bin/wget ]; then
        echo "wget found, proceeding."
        export DL_PKGMGRFIX='wget'
    elif [ -a /usr/bin/git ] && [ ! -a /bin/wget ]; then
        echo "Git found. proceeding.."
        export DL_PKGMGRFIX='git'
    else
        if [ ! -a /usr/bin/wget ] && [ ! -a /bin/wget ]; then
            echo "One or more required program is not installed. This script requires; Bash, Git or wget (to import necessary function)"
        fi
    fi
fi


## Checks for user's installed package manager,then downloads the necessary function source

# sets the beginning of an url to a variable
export DL_URL_PKGMGRFIX=https://github.com/Hafizat/pkgmgr-fix/

if [ -a /usr/bin/apt ]; then
    echo "Detected package manager: APT"
    echo "DPKG will be included. Please use the -dpkg to troubleshoot it."
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $DL_URL_PKGMGRFIX/func_call/apt_func.sh
        git clone $DL_URL_PKGMGRFIX/func_call/dpkg_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $DL_URL_PKGMGRFIX/func_call/apt_func.sh
        wget $DL_URL_PKGMGRFIX/func_call/dpkg_func.sh
    fi
elif [ -a /usr/bin/apt-get ]; then
    echo "Detected package manager: APT-GET"
    echo "DPKG will be available to troubleshoot via executing it with -dpkg"
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $DL_URL_PKGMGRFIX/func_call/apt-get_func.sh
        git clone $DL_URL_PKGMGRFIX/func_call/dpkg_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $DL_URL_PKGMGRFIX/func_call/apt-get_func.sh
        wget $DL_URL_PKGMGRFIX/func_call/dpkg_func.sh
    fi
elif [ ! -a /usr/bin/apt ] && [ ! -a /usr/bin/apt-get ] && [ ! -a /usr/bin/dpkg ]; then
    echo "Neither apt or apt-get was installed, yet dpkg is installed. Proceeding..."
    if [ $DL_PKGMGRFIX = git ]; then
        git clone $DL_URL_PKGMGRFIX/func_call/dpkg_func.sh
    elif [ $DL_PKGMGRFIX = wget ]; then
        wget $DL_URL_PKGMGRFIX/func_call/dpkg_func.sh
    fi


    