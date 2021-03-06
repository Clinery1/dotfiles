-- Maps for insert mode
vim.cmd("imap <C-Q> <ESC>:quitall!<CR>")
vim.cmd("imap <S-TAB> <ESC><<i")
vim.cmd("imap <F3> <ESC>:call LanguageClient#explainErrorAtPoint()<CR>a")
vim.cmd("imap <F4> •")
vim.cmd("imap <C-^> <ESC>^i")
vim.cmd("imap <C-r> <ESC>:call LanguageClient#explainErrorAtPoint()<CR>a")
vim.cmd("imap <C-s> <ESC>:w<CR>a")
vim.cmd("imap <C-t> <ESC>:tabedit<CR>")
vim.cmd("imap <C-Down> <ESC><C-w><Down>i")
vim.cmd("imap <C-Up> <ESC><C-w><Up>i")
vim.cmd("imap <C-Right> <ESC><C-w><Right>i")
vim.cmd("imap <C-Left> <ESC><C-w><Left>i")
vim.cmd("imap  <ESC>:CommentToggle<CR>a")    -- <C-/>, but that can't be bound for some reason


-- Maps for normal mode
vim.cmd("map <C-/> ^i// ")
vim.cmd("map ; :call SwitchNerdTree()<CR>")
vim.cmd("map <C-n> :NERDTreeClose<CR>")
vim.cmd("map <TAB> :tabnext<CR>")
vim.cmd("map t :tabedit<CR>")
vim.cmd("map <A-r> :w<CR>:tabedit<CR>:terminal fish -c run_less<CR>i")
vim.cmd("map <A-b> :w<CR>:tabedit<CR>:terminal fish -c build_less<CR>i")
vim.cmd("map <A-t> :w<CR>:tabedit<CR>:terminal fish -c test_less<CR>i")
vim.cmd("map <C-Left> :vertical resize +1<CR>")
vim.cmd("map <C-Right> :vertical resize -1<CR>")
vim.cmd("map <C-Up> :resize -1<CR>")
vim.cmd("map <C-Down> :resize +1<CR>")
vim.cmd("map <S-Up> :set splitbelow<CR>:split<CR>")
vim.cmd("map <S-Right> :set splitright<CR>:vsplit<CR>")
vim.cmd("map <S-Down> :set splitbelow&<CR>:split<CR>")
vim.cmd("map <S-Left> :set splitright&<CR>:vsplit<CR>")
vim.cmd("map  :CommentToggle<CR>")    -- <C-/>, but that can't be bound for some reason
vim.cmd("map q :q<CR>")
vim.cmd("map Q :quitall!<CR>")
vim.cmd("map w :w<CR>")
vim.cmd("map <S-TAB> :tabNext<CR>")
vim.cmd("map e :e ")
vim.cmd("map ff :foldclose<CR>")
vim.cmd("map F :foldopen<CR>")
vim.cmd("map B :buffers<CR>")
vim.cmd("map b :buffer")


-- Maps for visual mode
vim.cmd("vmap  :CommentToggle<CR>")
