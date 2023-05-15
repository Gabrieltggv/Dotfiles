set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.pyenv/bin $PATH
set PATH $HOME/.asdf/installs/golang/1.19/packages/bin $PATH

if type -q pyenv
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init - | source
    set PATH $HOME/.pyenv/shims $PATH
    pyenv global 3.10.2
end

set target """
SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0660", GROUP="adbusers"
SUBSYSTEM=="usb",ATTR{idVendor}=="04e8",ATTR{idProduct}=="6860",SYMLINK+="android_adb"
SUBSYSTEM=="usb",ATTR{idVendor}=="04e8",ATTR{idProduct}=="6860",SYMLINK+="android_fastboot"
"""

set -gx GPG_TTY (tty)
