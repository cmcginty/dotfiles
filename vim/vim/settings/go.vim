" enable auto-imports (replaces gofmt default)
let g:go_fmt_command = "goimports"

" force go to use quickfix only
let g:go_list_type = "quickfix"

" ignore format failures
let g:go_fmt_fail_silently = 1

" highlight all the shit
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
