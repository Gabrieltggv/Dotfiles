set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.pyenv/bin $PATH
if type -q pyenv
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init - | source
    set PATH $HOME/.pyenv/shims $PATH
    pyenv global 3.10.2
end

load_nvm
