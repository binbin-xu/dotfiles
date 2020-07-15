# pip should only run if there is a virtualenv currently activated
# comment it out due to conda confliction
#export PIP_REQUIRE_VIRTUALENV=true

# Cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Python startup file
export PYTHONSTARTUP=$HOME/.pythonrc

# # Vagrant
# VAGRANT_DISABLE_VBOXSYMLINKCREATE=1
#
# # ssg-agent
# if [ ! -S ~/.ssh/ssh_auth_sock ]; then
#       eval `ssh-agent`
#         ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
# fi
# export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
# ssh-add -l > /dev/null || ssh-add ~/.ssh/id_ed25519
