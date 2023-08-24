vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.asm  set ft=nasm")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.s  set ft=asm")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.idea  set ft=markdown wrap linebreak textwidth=120 spell")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.toml  set ft=cfg")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.fish  set ft=fish")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.glsl  set ft=glsl")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.gd  set ft=gdscript noexpandtab")

-- unfold all folds on file open
vim.cmd("au BufRead,BufWinEnter * normal zR")
-- run a C file
-- vim.cmd("autocmd BufEnter,BufRead *.c map <A-r> :execute 'let file=\"' expand('%:t') '\"'<CR>:w<CR>:tabedit<CR>:execute \"terminal ~/.bin/run_c_file --quiet \" file<CR>i")
-- run a C++ file
-- vim.cmd("autocmd BufEnter,BufRead *.cpp map <A-r> :execute 'let file=\"' expand('%:t') '\"'<CR>:w<CR>:tabedit<CR>:execute \"terminal ~/.bin/run_cpp_file --quiet \" file<CR>i")
-- vim.cmd("autocmd BufEnter,BufRead *.md set spell wrap linebreak nofoldenable textwidth=100")
-- vim.cmd("autocmd Filetype markdown LanguageToolSetUp")
vim.cmd("autocmd BufRead,BufNewFile,BufEnter *.rom set binary ft=xxd")
vim.cmd("autocmd BufNewFile,BufEnter *.lalrpop set ft=lalrpop")
-- fix the wrapping problem that appeared with treesitter-markdown
vim.cmd("autocmd BufNewFile,BufEnter *.md set wrap linebreak textwidth=100 spell")

-- autocommands to set the filetype of my created languages
vim.cmd("autocmd BufNewFile,BufEnter *.cppl set ft=cppl")
vim.cmd("autocmd BufNewFile,BufEnter *.docbuild set ft=docbuilder shiftwidth=4 tabstop=4")
vim.cmd("autocmd BufNewFile,BufEnter *.fanasm set ft=sexpression shiftwidth=4 tabstop=4")
vim.cmd("autocmd BufNewFile,BufEnter *.htsx set ft=sexpression shiftwidth=4 tabstop=4 commentstring=;%s")
vim.cmd("autocmd BufNewFile,BufEnter *.cssx set ft=sexpression shiftwidth=4 tabstop=4 commentstring=;%s")
vim.cmd("autocmd BufNewFile,BufEnter *.sexpr set ft=sexpression shiftwidth=4 tabstop=4 commentstring=;%s")
