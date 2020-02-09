#!/bin/bash

VERBOSE=0
GIT_CLONE="git clone --quiet"
LOG_DIR="${HOME}/.install_log"

INSTALL_PACMAN=(
    "cscope"
    "ctags"
    "cmake"
    "dfc"
    "doublecmd-gtk2"
    "fzf"
    "gdb"
    "gvim"
    "htop"
    "terminator"
    "the_silver_searcher"
    "quitzofratzl"
)

INSTALL_GIT=(
    "zsh"
    "sshmnt"
)

echo "Creating symbolic links ..."

sudo ln -s /media/data/Dropbox /dropbox
if [ $? != 0 ]; then
    echo -e "creating \e[93m'/media/data/Dropbox --> /dropbox'\e[0m ==> \e[91mFailed.\e[0m"
else
    echo -e "creating \e[93m'/media/data/Dropbox --> /dropbox'\e[0m ==> \e[92mSuccess.\e[0m"
fi
sudo ln -s /media/data/downloads /downloads
if [ $? != 0 ]; then
    echo -e "creating \e[93m'/media/data/downloads --> /downloads'\e[0m ==> \e[91mFailed.\e[0m"
else
    echo -e "creating \e[93m'/media/data/downloads --> /downloads'\e[0m ==> \e[92mSuccess.\e[0m"
fi

echo "Installing packages via pacman ..."

for i in "${INSTALL_PACMAN[@]}"; do
    sudo pacman --noconfirm --noprogressbar -S ${i}&> ${LOG_DIR}/install.log
    if [ $? != 0 ]; then
        echo -e "installing \e[93m'${i}'\e[0m ==> \e[91mFailed.\e[0m"
    else
        echo -e "installing \e[93m'${i}'\e[0m ==> \e[92mSuccess.\e[0m"
    fi
done

exit 0

for i in "${INSTALL_GIT[@]}"; do
    echo "Installing ${i} ...";
done

SSHMNT_DIR="${HOME}/.sshmnt"
SSHMNT_URL="https://github.com/prurigro/sshmnt"

ZSH_DIR="${HOME}/.zsh"
OMZ_URL="https://github.com/robbyrussell/oh-my-zsh.git"
OMZ_DIR="${ZSH_DIR}/oh-my-zsh"
OMZ_ASG_URL="https://github.com/zsh-users/zsh-autosuggestions.git"
OMZ_ASG_DIR="${OMZ_DIR}/custom/plugins/zsh-autosuggestions"

if [ "$VERBOSE" -ne 0 ]; then
    GIT_CLONE="git clone"
fi
if [ ! -d "${LOG_DIR}" ]; then
    mkdir --mode=0700 ${LOG_DIR}
    if [ $? != 0 ]; then
        echo "==> Cannot create log dir '${LOG_DIR}'. Exiting ..."
    fi
fi

ok=1
echo "==> Installing 'zsh' ..."
sudo pacman --noconfirm --noprogressbar -S zsh &> ${LOG_DIR}/install.log
if [ $? != 0 ]; then
    echo "Failed."
    ok=0
fi
echo "==> Success."

if [ $ok -eq 1 ]; then
    echo "==> Installing oh-my-zsh to ${OMZ_DIR} ..."
    if [ ! -d "${ZSH_DIR}" ]; then
        mkdir --mode=0700 "${ZSH_DIR}"
        if [ $? != 0 ]; then
            echo "==> Cannot create target dir '${ZSH_DIR}'. Exiting ..."
            exit 1
        fi
    fi

    ${GIT_CLONE} "${OMZ_URL}" "${OMZ_DIR}"
    if [ $? != 0 ]; then
        echo "==> Cannot clone from '${OMZ_URL}'. Skipping zsh-related items ..."
        ok=0
    else
        echo "==> Success."
        #cp ${OMZ_DIR}/templates/zshrc.zsh-template ${HOME}/.zshrc
    fi
fi

if [ $ok -eq 1 ]; then
    echo "==> Installing zsh-autosuggestions to ${OMZ_ASG_DIR} ..."
    ${GIT_CLONE} "${OMZ_ASG_URL}" "${OMZ_ASG_DIR}"
    if [ $? != 0 ]; then
        echo "==> Cannot clone from '${OMZ_ASG_URL}'. Skipping zsh-autosuggestions ..."
    else
        echo "==> Success."
    fi
fi
