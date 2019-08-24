from shutil import which
import shlex


def push_to_upstream():
    branch_name = $(git branch | grep '*' | cut -d ' ' -f2).rstrip()
    git push --set-upstream origin @(branch_name)


custom = {}

pairs = (
    ('gst', 'git status'),
    ('gco', 'git checkout'),
    ('gcam', 'git commit -am'),
    ('gf', 'git commit -a --amend'),
    ('ga', 'git add'),
    ('gp', 'git push'),
    ('gpull', 'git pull'),
    ('gpu', push_to_upstream),
    ('d', 'docker-compose exec'),
    ('fix', 'docker-compose exec frontend yarn fix'),
    ('cat', 'bat'),
    ('ls', 'exa'),
    ('vim', 'nvim'),
    ('ec', 'emacsclient'),
    ('yaourt', 'yay'),
    ('install-nocheck', 'yay -s --mflags --nocheck'),
)

for [key, name] in pairs:
    if callable(name) or which(shlex.split(name)[0]) is not None:
        custom[key] = name

aliases.update(custom)
