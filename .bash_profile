export LANG="en_US.UTF-8"
source ~/.git-completion.bash
alias ub1404='ssh root@10.0.0.143'
alias mini='ssh root@10.0.0.155'
alias gw-gaoc1='ssh root@10.2.18.200'
alias gw-gaoc2='ssh root@10.2.18.201'
alias ops-dev='ssh gaoc@ops-dev'
alias gentoo-linode='ssh root@45.56.94.30 -i /home/users/gaoc/.ssh/id_rsa.linode'
alias ll='ls -al'
#eval `ssh-agent`

if [ -f ~/.agent.env ]; then
        . ~/.agent.env >/dev/null
        if ! kill -0 $SSH_AGENT_PID >/dev/null 2>&1; then
                echo "Stale agent file found. Spawning new agent..."
                eval `ssh-agent |tee ~/.agent.env`
                ssh-add
        fi
else
        echo "Starting ssh-agent..."
        eval `ssh-agent |tee ~/.agent.env`
        ssh-add
fi
export PATH=$PATH:~/.local/bin/
