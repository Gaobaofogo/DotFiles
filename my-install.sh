# First command ever
sudo apt-get update && sudo apt-get -y upgrade

# Depedencies
sudo apt -y install curl zsh git terminator
git clone https://github.com/Gaobaofogo/DotFiles.git

# Install Meslo font
curl -o "MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo mv "MesloLGS NF Regular.ttf" /usr/local/share/fonts
fc-cache -f -v # Atualiza as fontes pro sistema. Pra funcionar mesmo, o usuário precisa reiniciar a máquina.

# Terminator config
mkdir ~/.config/terminator
cp DotFiles/terminator_config ~/.config/terminator/config

# Oh My Zsh
chsh -s $(which zsh)
cat /etc/passwd
curl -L http://install.ohmyz.sh | sh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # Auto Suggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting # Syntax Highlight

cp DotFiles/zshrc ~/.zshrc
