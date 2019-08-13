def push_to_remote():
    $branch_name = $(git branch | grep '*' | cut -d ' ' -f2).rstrip()
    git push --set-upstream origin $branch_name


aliases.update({
    'gst': 'git status',
    'gco': 'git checkout',
    'gcam': 'git commit -am',
    'gf': 'git commit -a --ammend',
    'ga': 'git add',
    'gp': 'git push',
    'gpull': 'git pull',
    'gpu': push_to_remote,
    'vim': 'nvim',
    'ec': 'emacsclient',
    'yaourt': 'yay',
    'cat': 'bat',
    'ls': 'exa',
    'd': 'docker-compose exec',
})
