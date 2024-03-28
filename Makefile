build:
	docker build . -t dotfiles:latest

run:
	docker run -it --rm --hostname ubuntu dotfiles:latest
