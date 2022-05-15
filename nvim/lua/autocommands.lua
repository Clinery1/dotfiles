vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.asm  set ft=nasm")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.s  set ft=asm")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.idea  set ft=markdown")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.toml  set ft=cfg")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.fish  set ft=fish")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.glsl  set ft=glsl")
vim.cmd("autocmd BufNewFile,BufRead,VimEnter,BufEnter *.gd  set ft=gdscript noexpandtab")
-- run a C file
vim.cmd("autocmd BufEnter,BufRead *.c map <A-r> :execute 'let file=\"' expand('%:t') '\"'<CR>:w<CR>:tabedit<CR>:execute \"terminal ~/.bin/run_c_file --quiet \" file<CR>i")
-- run a C++ file
vim.cmd("autocmd BufEnter,BufRead *.cpp map <A-r> :execute 'let file=\"' expand('%:t') '\"'<CR>:w<CR>:tabedit<CR>:execute \"terminal ~/.bin/run_cpp_file --quiet \" file<CR>i")
-- convert a markdown file to a PDF file
vim.cmd("autocmd BufEnter,BufRead *.md map <A-b> :execute 'let file=\"' expand('%:t') '\"'<CR>:w<CR>:tabedit<CR>:execute \"terminal md_to_pdf \" file<CR>i")
vim.cmd([[
augroup Markdown
    au!
    au BufReadPre  *.md set spell wrap linebreak nofoldenable
    au BufReadPost *.md set spell wrap linebreak nofoldenable
augroup END
]])
-- vim.cmd("autocmd Filetype markdown LanguageToolSetUp")
vim.cmd("autocmd BufRead,BufNewFile *.awf set ft=awf")
vim.cmd("autocmd BufRead,BufNewFile,BufEnter *.rom set binary ft=xxd")
