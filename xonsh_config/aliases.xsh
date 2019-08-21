from shutil import which
import shlex


def push_to_remote():
    branch_name = $(git branch | grep '*' | cut -d ' ' -f2).rstrip()
    git push --set-upstream origin @(branch_name)


custom_aliases = {
    'gst': 'git status',
    'gco': 'git checkout',
    'gcam': 'git commit -am',
    'gf': 'git commit -a --amend',
    'ga': 'git add',
    'gp': 'git push',
    'gpull': 'git pull',
    'gpu': push_to_remote,
    'd': 'docker-compose exec',
    'fix': 'docker-compose exec frontend yarn fix',
}

optional = [
    ['cat', 'bat'],
    ['ls', 'exa'],
    ['vim', 'nvim'],
    ['ec', 'emacsclient'],
    ['yaourt', 'yay'],
    ['install-nocheck', 'yay -S --mflags --nocheck'],
]

for [key, name] in optional:
    if which(shlex.split(name)[0]) is not None:
        custom_aliases[key] = name

aliases.update(custom_aliases)
