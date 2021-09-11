# TMOUT=259200
export LANG="en_US.UTF-8"
# pip install xxx --user 会安装在 ~/.local/bin/
export PATH=$PATH:~/.local/bin/

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

# bashit 的配置在 .bashrc
if [ -f ~/.bashrc ]; then
      . ~/.bashrc
fi
