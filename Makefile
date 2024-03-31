build:
	docker build . -t dotfiles:latest

run:
	docker run -it --rm --hostname ubuntu dotfiles:latest
# ./dotfiles/install.sh --force && source ~/.bashrc && bash
