from shutil import which
import shlex
import os


def _gpu():
    branch_name = $(git branch | grep '*' | cut -d ' ' -f2).rstrip()
    git push --set-upstream origin @(branch_name)


pairs = (
    ('gst', 'git status'),
    ('gco', 'git checkout'),
    ('gcam', 'git commit -am'),
    ('gf', 'git commit -a --amend'),
    ('ga', 'git add'),
    ('gp', 'git push'),
    ('gpull', 'git pull'),
    ('gpu', _gpu),
    ('d', 'docker-compose exec'),
    ('fix', 'docker-compose exec frontend yarn fix'),
    ('cat', 'bat'),
    ('ls', 'exa'),
    ('vim', 'nvim'),
    ('ec', 'emacsclient'),
    ('yaourt', 'yay'),
    ('install-nocheck', 'yay -S --mflags "--nocheck --skipinteg"'),
    ('rgf', 'rg --fixed-strings'),
    ('rgi', 'rg -i'),
    ('rgfi', 'rg --fixed-strings -i'),
)

for pair in pairs:
    key, name = pair
    if callable(name):
        name.__xonsh__threadable = False
        name.__xonsh__capturable = False

    if callable(name) or which(shlex.split(name)[0]) is not None:
        aliases[key] = name
