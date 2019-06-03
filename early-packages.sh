#!/bin/sh

printf "\n[Enable rpm-fusion-repos]\n"
sudo dnf install \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

printf "\n[Upgrade packages]\n"
sudo dnf --refresh \
	upgrade

printf "\n[Clone dotfiles]\n"
git clone \
	git@github.com:didiksupriadi41/dotfiles.git

printf "\n[Enable i3-gaps]\n"
sudo dnf copr enable \
	gregw/i3desktop

printf "\n[Install dependencies]\n"
sudo dnf install \
	atool \
	chromium \
	cmake \
	compton \
	dmenu \
	feh \
	fzf \
	gcc-c++ \
	hexchat \
	i3-gaps \
	i3lock \
	i3status \
	inkscape \
	light \
	lm_sensors \
	make \
	mpv \
	neovim \
	python3-devel \
	python3-neovim \
	ranger \
	rxvt-unicode-256color-ml \
	unrar \
	vim \
	zathura-djvu \
	zathura-pdf-mupdf

# Enable Flathub
printf "\n[Enable flathub]\n"
flatpak remote-add --if-not-exists \
	flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Telegram
printf "\n[Install Telegram]\n"
flatpak install flathub \
	org.telegram.desktop

# Install openjdk 8, 11, & latest
printf "\n[Install openjdk-8]\n"
sudo dnf install \
	java-1.8.0-openjdk-src \
	java-1.8.0-openjdk-devel \
	java-1.8.0-openjdk-javadoc
printf "\n[Install openjdk-11]\n"
sudo dnf install \
	java-11-openjdk-src \
	java-11-openjdk-devel \
	java-11-openjdk-javadoc
printf "\n[Install openjdk-latest]\n"
sudo dnf install \
	java-latest-openjdk-src \
	java-latest-openjdk-devel \
	java-latest-openjdk-javadoc

# Install maven
printf "\n[Install maven]\n"
sudo dnf install \
	maven
