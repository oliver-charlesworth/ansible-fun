# --------------------------- #
# Deployed via Ansible - don't edit directly!
# --------------------------- #

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
