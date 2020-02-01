script_loc=$(dirname $0)

. $script_loc/arch_desktop_pkg_defs.sh

# run the installation for the normal pacman packages
sudo pacman -S $pacman_pkgs

# install yay
pushd $PKG_DIR

git clone https://aur.archlinux.org/yay.git
pushd yay
makepkg -sic
popd # yay


popd # $PKG_DIR

yay -S $aur_pkgs
