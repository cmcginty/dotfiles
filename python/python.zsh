# Enable virtualenvwrapper (https://virtualenvwrapper.readthedocs.io/en/latest/)
# Adds the following commands:
#
#   add2virtualenv:        add directory to the import path
#   allvirtualenv:         run a command in all virtualenvs
#   cdproject:             change directory to the active project
#   cdsitepackages:        change to the site-packages directory
#   cdvirtualenv:          change to the $VIRTUAL_ENV directory
#   cpvirtualenv:          duplicate the named virtualenv to make a new one
#   lssitepackages:        list contents of the site-packages directory
#   lsvirtualenv:          list virtualenvs
#   mkproject:             create a new project directory and its associated virtualenv
#   mktmpenv:              create a temporary virtualenv
#   mkvirtualenv:          Create a new virtualenv in $WORKON_HOME
#   rmvirtualenv:          Remove a virtualenv
#   setvirtualenvproject:  associate a project directory with a virtualenv
#   showvirtualenv:        show details of a single virtualenv
#   toggleglobalsitepackages: turn access to global site-packages on/off
#   virtualenvwrapper:     show this help message
#   wipeenv:               remove all packages installed in the current virtualenv
#   workon:                list or change working virtualenvs

# disable the builtin prompt since it's managed by ZSH
export VIRTUAL_ENV_DISABLE_PROMPT=1

if [[ "$OSTYPE" == linux* ]]; then
   source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

elif [[ "$OSTYPE" == darwin* ]]; then
   source /usr/local/bin/virtualenvwrapper.sh
fi
