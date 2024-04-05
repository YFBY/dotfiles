#launch after archinstall and rebooted
#zshrc autosuggestion
#automount disk


#config setup --make .config if there is no .config folder
cp -r ~/dotfiles/configfiles/home/* ~/
cp -r ~/dotfiles/configfiles/config/* ~/.config/



#install zram if needed
sudo pacman -S zram-generator --noconfirm --needed
echo '[zram0]
zram-size = ram / 2
compression-algorithm = zstd' | sudo tee /etc/systemd/zram-generator.conf
sudo systemctl daemon-reload
sudo systemctl start /dev/zram0



#install yay
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#install flatpak for more software
sudo pacman -S flakpak

#set up grub theme
cd ~
sudo git clone https://github.com/semimqmo/sekiro_grub_theme
cd sekiro_grub_theme
sh install.sh

#set up lightdm as display manager
sudo pacman -S lightdm lightdm-webkit2-greeter
yay -S lightdm-webkit-theme-aether
sudo systemctl enable lightdm.service

#setup shell
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc


#install required fonts
sudo pacman -S ttf-hack ttf-fira-code ttf-dejavu
sudo pacman -S ttf-hack-nerd ttf-firacode-nerd ttf-dejavu-nerd

#install setup
sudo pacman -S i3-wm picom rofi polybar dunst
sudo pacman -S feh #nitrogen
sudo pacman -S polkit-gnome #for polkit
#yay -S autotiling #weird

pacman -S xss-lcok
yay -S betterlockscreen
yay -S caffeine-ng

sudo pacman -S kitty
sudo pacman -S alacritty

#lockscreen
betterlockscreen -u ~/wallpaper/

#set up audio
sudo pacman -S pipewire pipewire-pulse wireplumber #or pipewire and its dependencies
sudo pacman -S pavucontrol #more pulseaudio control

#code editor
sudo pacman -S neovim
sudo pacman -S xclip #for clipboard
sudo pacman -S ripgrep # for telescope
sudo pacman -S npm #for plugins

#internet
sudo pacman -S firefox #browser
sudo pacman -S qbittorrent #torrent

#other(optional)
sudo pacman -S keepassxc && cp ~/dotfiles/configfiles/YFBYPassword.kdbx ~/

#pacman yay flatpak

#sudo pacman -S nomacs(optional)
vlc
thunar
htop
godot
blender
lutris
gimp
inkscape
pixelorama

obs-studio
flameshot

lmms
audacity
shotcut

stremio

sudo pacman -S tor #you have to enable in firefox manually btw or you can just use the tor network for other things

sudo pacman -S gparted

#customizastion
sudo pacman -S lxappearance
sudo pacman -S xdg-utils#just use xdg-mime for setting default applications

arc-gtk-theme
papirus-icon-theme
yay -S dracula-gtk-theme
yay -S xcursor-breeze

sudo pacman -S cheese

#for laptop
sudo pacman -S brightnessctl
#bluetooth
pacman -S bluez bluez-utils
pacman -S blueman
modprobe btusb
sudo systemctl enable bluetooth.service
#set up network configuration
#sudo pacman -S networkmanager #its prob gonna get installed by archinstall
sudo pacman -S network-manager-applet
sudo systemctl enable NetworkManager.service






#i3, bspwm, sway, hyprland, awesomewm, qtile and maybe openbox
#zsh, zsh extensions
#custom page for firefox homepage and newtab
#zsh plugins, terminal tools
#eww, conky, rofi, neovim
#polybar better powermenu, add other modules, add other statuses
#picom exclude programs = rofi, i3, firefox cursor
#dunst, dunst new notification start at top then go to bottom
#show updatable packages polybar
#How to set boot screen logo
#change system components to xfce or kde or mate, like polkit auth
#theme and icon and cursor
#alicritty
#fix launch startup programs on ~/.config/autostart
#i3 minimize
#add suspend, hibernate on polybar
#i3 shortcut for power controls
#add to backup
#change color theme kitty, dunst, rofi
#update config version
#default font
#a way to manage wine or windows programs
#docker & git & virtual machines
