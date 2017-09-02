" enable auto-imports (replaces gofmt default)
let g:go_fmt_command = "goimports"

" force go to use quickfix only
let g:go_list_type = "quickfix"

" ignore format failures
let g:go_fmt_fail_silently = 1

" highlight all the shit
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1

" don't really care about whitespace
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0

" faster def lookups
let g:go_def_mode = 'godef'
