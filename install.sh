#!/bin/bash

VERBOSE=0
GIT_CLONE_CMD="git clone --quiet"
PKG_INSTALL_CMD="pacman --noconfirm --noprogressbar -S"
LOG_DIR="${HOME}/.install_log"

if [[ ! -d ${LOG_DIR} ]]; then
    mkdir ${LOG_DIR}
    if [[ $? -ne 0 ]]; then
        echo "Cannot create ${LOG_DIR}. Exiting ..."
        exit 1
    fi
fi

INSTALL_AUR=(
    "vivaldi"
    "vivaldi-ffmpeg-codecs"
    "vivaldi-widevine" # evtl ...
)

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
    "meld"
    "tilix"
    "fd"
    "the_silver_searcher"
    "zsh"
    "quitzofratzl" # Testing dummy ...
)

INSTALL_GIT=(
    "sshmnt"
)

SYMBOLIC_LINKS=(
    "/downloads:/media/data/downloads"
    "/dropbox:/media/data/Dropbox"
)

#=================================[ SYMBOLIC LINKS ]=================================

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

#================================[ PACMAN PACKAGES ]=================================

echo "Installing packages via pacman ..."

for i in "${INSTALL_PACMAN[@]}"; do
    sudo ${PKG_INSTALL_CMD} ${i}&> ${LOG_DIR}/install.log
    if [ $? != 0 ]; then
        echo -e "installing \e[93m'${i}'\e[0m ==> \e[91mFailed.\e[0m"
    else
        echo -e "installing \e[93m'${i}'\e[0m ==> \e[92mSuccess.\e[0m"
    fi
done

#================================[ GITHUB PACKAGES ]=================================

echo "Installing packages from github ..."

SSHMNT_URL="https://github.com/prurigro/sshmnt"
SSHMNT_DIR="${HOME}/.sshmnt"

ZSH_DIR="${HOME}/.zsh"
OMZ_URL="https://github.com/robbyrussell/oh-my-zsh.git"
OMZ_DIR="${ZSH_DIR}/oh-my-zsh"
OMZ_ASG_URL="https://github.com/zsh-users/zsh-autosuggestions.git"
OMZ_ASG_DIR="${OMZ_DIR}/custom/plugins/zsh-autosuggestions"
OMZ_PL10K_URL="https://github.com/romkatv/powerlevel10k.git"
OMZ_PL10K_DIR="${OMZ_DIR}/custom/themes"

if [ "$VERBOSE" -ne 0 ]; then
    GIT_CLONE_CMD="git clone"
fi
if [ ! -d "${LOG_DIR}" ]; then
    mkdir --mode=0700 ${LOG_DIR}
    if [ $? != 0 ]; then
        echo "==> Cannot create log dir '${LOG_DIR}'. Exiting ..."
    fi
fi

echo "installing custom zsh plugins ..."

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

    ${GIT_CLONE_CMD} "${OMZ_URL}" "${OMZ_DIR}"
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
    ${GIT_CLONE_CMD} "${OMZ_ASG_URL}" "${OMZ_ASG_DIR}"
    if [ $? != 0 ]; then
        echo "==> Cannot clone from '${OMZ_ASG_URL}'. Skipping zsh-autosuggestions ..."
    else
        echo "==> Success."
    fi
fi

if [ $ok -eq 1 ]; then
    echo "==> Installing powerlevel10k theme to ${OMZ_PL10K_DIR} ..."
    ${GIT_CLONE_CMD} --depth=1 "${OMZ_PL10K_URL}" "${OMZ_PL10K_DIR}"
    if [ $? != 0 ]; then
        echo "==> Cannot clone from '${OMZ_PL10K_URL}'. Skipping powerlevel10k theme ..."
    else
        echo "==> Success."
    fi
fi
