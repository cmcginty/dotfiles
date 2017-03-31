" JAVA filetype configuration

" set compiler, build java classes, jump to first error
compiler gradlew

map <silent> <leader>m     :wall<bar>make classes compileTestJava -Dorg.gradle.parallel=false<cr><cr>
" TIP: Use vim-unimpaired to navigate the quickfixes
"        ]q    Next error
"        [q    Previous error
"        [Q    First error
"        ]Q    Last error

" increase max line length and match
setlocal textwidth=100
