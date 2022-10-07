#!/bin/bash

echo "DNF configure"
sudo rm /etc/dnf/dnf.conf
sudo cp dnf.conf /etc/dnf/

echo "upgrading system"

sudo dnf upgrade --refresh -y

echo "Installing Brave Browser"

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo dnf install brave-browser -y

echo "Installing VS Code"

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo cp vscode.repo /etc/yum.repos.d/
sudo dnf install code -y

echo "Installing Golang"

sudo dnf install golang -y
go version

echo "Installing Rust"

sudo dnf install rust cargo -y
rustc -V
cargo -V
rustdoc -V

echo "Installing vlc media player"

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install vlc -y

echo "Adding bash_aliases to bashrc"

cp /.bash_aliases ~
cp add_bash_aliases.txt ~
cat add_bash_aliases.txt | sudo tee -a ~/.bashrc
rm add_bash_aliases.txt

#Git configuaration

git config --global user.name "Abhishekkarunakaran"
git config --global user.email abhishekkarunakaran100@gmail.com

