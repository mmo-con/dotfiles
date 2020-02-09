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
    "lsd"
    "terminator"
    "the_silver_searcher"
    "zsh"
    "quitzofratzl"
)

INSTALL_GIT=(
    "sshmnt"
)

SYMBOLIC_LINKS=(
    "/downloads:/media/data/downloads"
    "/dropbox:/media/data/Dropbox"
)

echo "Creating symbolic links ..."

for i in "${SYMBOLIC_LINKS[@]}"; do
    KEY="${i%%:*}"
    VALUE="${i##*:}"

    sudo ln --symbolic --no-dereference ${VALUE} ${KEY}
    if [ $? != 0 ]; then
        echo -e "creating \e[93m' ${VALUE} --> ${KEY}'\e[0m ==> \e[91mFailed.\e[0m"
    else
        echo -e "creating \e[93m'${VALUE} --> ${KEY}'\e[0m ==> \e[92mSuccess.\e[0m"
    fi
done

echo "Installing packages via pacman ..."

for i in "${INSTALL_PACMAN[@]}"; do
    sudo pacman --noconfirm --noprogressbar -S ${i}&> ${LOG_DIR}/install.log
    if [ $? != 0 ]; then
        echo -e "installing \e[93m'${i}'\e[0m ==> \e[91mFailed.\e[0m"
    else
        echo -e "installing \e[93m'${i}'\e[0m ==> \e[92mSuccess.\e[0m"
    fi
done

echo "Installing packages from github ..."

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
if [ $ok -eq 1 ]; then
    echo "installing oh-my-zsh to ${OMZ_DIR} ..."
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
