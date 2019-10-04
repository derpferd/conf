
DEPS = git
# Check for dependances in path
K := $(foreach exec,$(DEPS),$(if $(shell which $(exec)),some string,$(error No $(exec) in PATH)))

install: download link

download:
	(cd ~; git clone https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh)
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	(cd ~; (curl https://pyenv.run | bash) || true)

link:
	mkdir -p ~/.config
	ln -s ~/conf/config/nvim ~/.config/nvim
	ln -s ~/conf/config/pep8 ~/.config/pep8
	ln -s ~/conf/oh-my-zsh/custom/themes/jbb.zsh-theme ~/.oh-my-zsh/custom/themes/jbb.zsh-theme
	ln -s ~/conf/rc ~/.rc
	ln -s ~/conf/oh-my-zsh/custom/plugins/amazon ~/.oh-my-zsh/custom/plugins/amazon
	ln -s ~/conf/tmux.conf ~/.tmux.conf
	ln -s ~/conf/tmux.conf.local ~/.tmux.conf.local
	ln -s ~/conf/zshrc ~/.zshrc

clean: unlink remove

unlink:
	rm -f ~/.rc
	rm -f ~/.oh-my-zsh/custom/plugins/amazon
	rm -f ~/.oh-my-zsh/custom/themes/jbb.zsh-theme
	rm -f ~/.tmux.conf
	rm -f ~/.tmux.conf.local
	rm -f ~/.zshrc
	rm -f ~/.config/nvim
	rm -f ~/.config/pep8

remove:
	rm -rf ~/.oh-my-zsh

