
DEPS = git
# Check for dependances in path
K := $(foreach exec,$(DEPS),$(if $(shell which $(exec)),some string,$(error No $(exec) in PATH)))

install: preinstall download link

preinstall:
	./preinstall.sh

download:
	(cd ~; git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh)
	(cd ~; git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm)
	(cd ~/.ssh; curl https://security-bastions.amazon.com/noauth/bastions/prod/redhat.ssh.config > config)
	./fix_oh_my_zsh.sh
	nix-env -i tmux zsh pgcli neovim

link:
	ln -s ~/conf/oh-my-zsh/custom/themes/jbb.zsh-theme ~/.oh-my-zsh/custom/themes/jbb.zsh-theme
	ln -s ~/conf/rc ~/.rc
	ln -s ~/conf/oh-my-zsh/custom/plugins/amazon ~/.oh-my-zsh/custom/plugins/amazon
	ln -s ~/conf/tmux.conf ~/.tmux.conf
	ln -s ~/conf/tmux.conf.local ~/.tmux.conf.local
	ln -s ~/conf/vimrc ~/.vimrc
	ln -s ~/conf/zshrc ~/.zshrc
	ln -s ~/conf/zshenv ~/.zshenv
	ln -s ~/conf/mossy ~/.mossy
	mkdir -p ~/.config/cr
	ln -s ~/conf/config/cr/preferences ~/.config/cr/preferences


clean: unlink remove

unlink:
	rm -f ~/.rc
	rm -f ~/.oh-my-zsh/custom/plugins/amazon
	rm -f ~/.oh-my-zsh/custom/themes/jbb.zsh-theme
	rm -f ~/.tmux.conf
	rm -f ~/.tmux.conf.local
	rm -rf ~/.tmux/plugins/tpm
	rm -f ~/.vimrc
	rm -f ~/.zshrc
	rm -f ~/.zshenv
	rm -f ~/.mossy
	rm -f ~/.config/cr/preferences

remove:
	rm -rf ~/.oh-my-zsh

