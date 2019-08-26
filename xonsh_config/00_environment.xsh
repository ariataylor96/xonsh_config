import os

$PATH = $PATH + [
    os.path.expanduser(p)
    for p in
    [
        '~/bin',
        '~/.local/bin',
    ]
    if os.path.isdir(os.path.expanduser(p))
]
$BROWSER = 'firefox'
$EDITOR = 'emacsclient'

$XONSH_COLOR_STYLE = 'native'
$COMPLETIONS_CONFIRM = True
$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True


def set_color_scheme(name):
    $XONSH_COLOR_STYLE = name


def load_nvm():
    $NVM_DIR = "~/.nvm"
    source-bash "~/.nvm/nvm.sh"


def load_rvm():
    source-bash "~/.rvm/scripts/rvm"
