from shutil import which
import shlex


def _gpu():
    branch_name = $(git branch | grep '*' | cut -d ' ' -f2).rstrip()
    git push --set-upstream origin @(branch_name)


def _update_mirrors():
    curl -s "https://www.archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 10 - | sudo sponge /etc/pacman.d/mirrorlist


custom = {}

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
    ('install-nocheck', 'yay -s --mflags --nocheck'),
    ('update-mirrors', _update_mirrors),
)

for [key, name] in pairs:
    if callable(name) or which(shlex.split(name)[0]) is not None:
        custom[key] = name

aliases.update(custom)
