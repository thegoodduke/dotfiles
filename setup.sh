#!/bin/bash

PROGPATH=$(realpath ${BASH_SOURCE})
DWORK=$(dirname ${PROGPATH})

BASHIT=${HOME}"/.bash_it"
VUNDLE=${HOME}"/.vim/bundle/Vundle.vim"

check_software_exist(){
    softwares=("tmux" "vim" "git")
    for sw in "${softwares[@]}"; do
        type ${sw} > /dev/null 2>&1 || 
        	{ echo >&2 "ERROR: **${sw}** is not installed!"; exit 1; }
    done
}

create_symlinks(){
    dotfiles=(".bash_profile" ".bashrc" ".tmux.conf" ".vimrc" ".gitconfig" ".muttrc")
    for dotfile in "${dotfiles[@]}"; do
        ln -sf ${DWORK}/${dotfile} ${HOME}/${dotfile}
        echo "Create symlink ${HOME}/${dotfile}"
    done
}

install_bashit(){
    if [ -d "${BASHIT}" ]; then
        cd "${BASHIT}"
        echo "Change directory to `pwd`"
        echo "${BASHIT} exists. Git pull to update..."
        # git pull
        cd - > /dev/null 2>&1
        echo "Change directory back to `pwd`"
    else
        echo "${BASHIT} not exists. Install..."
        git clone --depth=1 https://github.com/Bash-it/bash-it.git ${BASHIT}
        ${BASHIT}/install.sh
    fi
}

# Vim install `Vundle` and plugins
install_vundle(){
    if [ -d "${VUNDLE}" ]; then
        cd "${VUNDLE}"
        echo "Change directory to `pwd`"
        echo "${VUNDLE} exists. Git pull to update..."
        # git pull
        cd - > /dev/null 2>&1
        echo "Change directory back to `pwd`"
    else
        echo "${VUNDLE} not exists. Git clone to create..."
        git clone https://github.com/VundleVim/Vundle.vim.git ${VUNDLE}
        vim +PluginInstall +qall
    fi
}

config_bashit(){
    ln -sf ${DWORK}/custom.aliases.bash ${BASHIT}/aliases/custom.aliases.bash
    echo "Create symlink ${BASHIT}/aliases/custom.aliases.bash"
    source ${HOME}/.bash_profile
}

config_ssh(){
    [ -d ${HOME}/.ssh ] || mkdir ${HOME}/.ssh
    ln -sf ${DWORK}/ssh_config ${HOME}/.ssh/config
    echo "Create symlink ${HOME}/.ssh/config"
}

main(){
    check_software_exist
    install_bashit
    install_vundle
    create_symlinks
    config_ssh
    config_bashit
}

main

echo "[SETUP OK]"
