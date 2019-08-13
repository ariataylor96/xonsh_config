prompt_components = [
    # user@host
    '{env_name}',
    '{BOLD_INTENSE_CYAN}',
    '{user}',
    '{INTENSE_YELLOW}',
    '@',
    '{BOLD_INTENSE_BLUE}',
    '{hostname}',
    
    # :dir
    ':',
    '{BOLD_INTENSE_GREEN}',
    '{cwd}',
    
    # git branch/status
    ' ',
    '{branch_color}',
    '{gitstatus}',
    
    # newline, $ 
    '\n',
    '{INTENSE_RED}',
    '{prompt_end}',
    '{NO_COLOR}',
    ' ',
]

$PROMPT = ''.join(prompt_components)
