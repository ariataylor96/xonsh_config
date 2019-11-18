import os

$N_PREFIX = os.path.expanduser('~/n')

$PATH = [os.path.join($N_PREFIX, 'bin')] + $PATH + [
    os.path.expanduser(p)
    for p in
    [
        '~/bin',
        '~/.local/bin',
    ]
]
$BROWSER = 'firefox'
$EDITOR = 'emacsclient'

$XONSH_COLOR_STYLE = 'native'
$COMPLETIONS_CONFIRM = True
$FOREIGN_ALIASES_SUPPRESS_SKIP_MESSAGE = True
$PUNCTUAL_PACKAGE_DIR = '~/Projects/dotfiles'


def set_color_scheme(name):
    $XONSH_COLOR_STYLE = name


def load_rvm():
    source-bash "~/.rvm/scripts/rvm"
