# Facebook CLI tools


# Create a new paste that shows the actual command used to generate it:
#   Ex:
#       my-cmd | pastry
#       pastry-show-cmd PXXXXX
function pastry-show-cmd {
   LAST_COMMAND="$(history -1 | sed -e 's/\s*[0-9]*\s*//')"
   { echo "\$ ${LAST_COMMAND}" & pastry $1; } |
      pastry
}
