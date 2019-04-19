# Enable pyenv and pyenv-virtualenv
#
# See https://github.com/yyuu/pyenv-virtualenv
#
# Install python version:
#     pyenv install 3.5.1
#
# Setup a python project:
#     cd my/project
#     venv 3.5.1 projname
#     pyenv local projname
#
# Change python versions:
#     pyenv shell VERSION
#
# Set global python version:
#     pyenv global VERSION
#
# Read more at:
#  http://akbaribrahim.com/managing-multiple-python-versions-with-pyenv/
#  http://blog.froehlichundfrei.de/2014/11/30/my-transition-to-python3-and-pyenv-goodby-virtualenvwrapper.html

# Uncomment if the pyenv stops working or runs slowly.
# export PYENV_DEBUG=1

# Customize python REPL
export PYTHONSTARTUP=~/.startup.py

# virtualenv aliases
alias venv='pyenv virtualenv'
alias activate='pyenv activate'
alias deactivate='pyenv deactivate'
# enable pydoc in virtualenvs
alias pydoc='python -m pydoc'

alias nose='nosetests -vs --pdb'
alias pt='PYTHONPATH=$PYENV_VIRTUAL_ENV/lib/python3.6/site-packages ptpython'
alias pip-update='pip3 list --outdated --format=freeze |
  grep -v \^\-e | cut -d = -f 1 | xargs -n1 pip3 install -U'
