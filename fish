set VIRTUAL_ENV_DISABLE_PROMPT disable
set pipenv_fish_fancy yes 
status --is-interactive; and source (pyenv init -|psub)
