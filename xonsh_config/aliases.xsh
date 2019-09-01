from shutil import which
import shlex
import os


def _gpu():
    branch_name = $(git branch | grep '*' | cut -d ' ' -f2).rstrip()
    git push --set-upstream origin @(branch_name)


def _update_mirrors():
    curl -s "https://www.archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 10 - | sudo sponge /etc/pacman.d/mirrorlist


def _update_plex(args):
    file_name, ip = args
    connection_string = f'root@{ip}'
    base_file_name = os.path.basename(file_name)

    rsync -avz --progress @(file_name) @(connection_string + ':')
    ssh @(connection_string) dpkg -i @(base_file_name)
    ssh @(connection_string) rm @(base_file_name)
    ssh @(connection_string) systemctl restart plexmediaserver


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
    ('install-nocheck', 'yay -S --mflags "--nocheck --skipinteg"'),
    ('update-mirrors', _update_mirrors),
    ('update-plex', _update_plex),
)

for [key, name] in pairs:
    if callable(name) or which(shlex.split(name)[0]) is not None:
        custom[key] = name

aliases.update(custom)
