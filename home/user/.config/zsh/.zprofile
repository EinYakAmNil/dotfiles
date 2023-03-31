#                      __ _ _      
# _____ __  _ __ ___  / _(_) | ___ 
#|_  / '_ \| '__/ _ \| |_| | |/ _ \
# / /| |_) | | | (_) |  _| | |  __/
#/___| .__/|_|  \___/|_| |_|_|\___|
#    |_|                           
#
# Start DE/WM on login

# Environment variables
export PATH=$PATH:$HOME/.local/bin
export BROWSER=brave
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export XDG_CONFIG_HOME=/home/linkai/.config
export BIBLIOTHEK=/home/linkai/Calibre-Bibliothek
export SUDO_ASKPASS=$HOME/.local/bin/zenity_askpass

# Custom sockets
export MPVSOCKET="$XDG_RUNTIME_DIR/mpv.socket"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Dark mode for applications (GTK, Qt, Calibre, ...)
export GTK2_RC_FILES=/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc
export GTK_THEME=Arc-Dark
export QT_STYLE_OVERRIDE=Adwaita-Dark
export CALIIBRE_USE_DARK_PALETTE=1

