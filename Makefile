
DEPS = git
# Check for dependances in path
K := $(foreach exec,$(DEPS),$(if $(shell which $(exec)),some string,$(error No $(exec) in PATH)))

install: preinstall download link

preinstall:
	(groups | grep 'sudo' > /dev/null && ./preinstall.sh)

download:
	(cd ~; git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh)
	(curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

link:
	(mkdir -p ~/.config; ln -s ~/conf/config/nvim ~/.config/nvim)
	ln -s ~/conf/oh-my-zsh/custom/themes/jbb.zsh-theme ~/.oh-my-zsh/custom/themes/jbb.zsh-theme
	ln -s ~/conf/rc ~/.rc
	ln -s ~/conf/oh-my-zsh/custom/plugins/amazon ~/.oh-my-zsh/custom/plugins/amazon
	ln -s ~/conf/tmux.conf ~/.tmux.conf
	ln -s ~/conf/tmux.conf.local ~/.tmux.conf.local
	ln -s ~/conf/zshrc ~/.zshrc
	ln -s ~/conf/gitconfig ~/.gitconfig

clean: unlink remove

unlink:
	rm -f ~/.rc
	rm -f ~/.oh-my-zsh/custom/plugins/amazon
	rm -f ~/.oh-my-zsh/custom/themes/jbb.zsh-theme
	rm -f ~/.tmux.conf
	rm -f ~/.tmux.conf.local
	rm -f ~/.zshrc
	rm -f ~/.gitconfig
	rm -f ~/.config/nvim

remove:
	rm -rf ~/.oh-my-zsh

