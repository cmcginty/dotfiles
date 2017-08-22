# Set the PREZTO prompt theme

# You can view all available prompts using the command:
#
#     prompt <TAB>
#     prompt -l
#
# Preview ALL or one prompt using the command:
#
#     prompt -p [NAME]
#
# Good default prompt themes
#
# prompt agnoster
# prompt pure
# prompt skwp
# prompt smiley
# prompt sorin
# prompt steef

# You can add your own custom theme in ./prompts dir as `prompt_<NAME>_setup`

prompt sorin

# force all prompt to have linebreak
function prompt_custom_precmd { echo '' }
add-zsh-hook precmd prompt_custom_precmd
