-- Maps for insert mode
local insert_maps = {
    {"<C-Q>", "<ESC>:quitall!<CR>"},
    {"<S-Tab>", "<ESC><<i"},
    {"<F4>", "•"},
    {"<C-^>", "<ESC>^i"},
    {"<C-s>", "<ESC>:w<CR>a"},
    {"<C-t>", "<ESC>:tabedit<CR>"},
    {"<C-Down>", "<ESC><C-w><Down>a"},
    {"<C-Up>", "<ESC><C-w><Up>a"},
    {"<C-Right>", "<ESC><C-w><Right>a"},
    {"<C-Left>", "<ESC><C-w><Left>a"},
    {"<C-/>", "<ESC>:CommentToggle<CR>a"},
}
for i, binding in ipairs(insert_maps) do
    vim.keymap.set("i", binding[1], binding[2], binding[3])
end


-- Maps for normal mode
local normal_maps = {
    {"rn", vim.lsp.buf.rename},
    {"<C-/>", ":CommentToggle<CR>"},
    {";", ":call SwitchNerdTree()<CR>"},
    {"<C-n>", ":NERDTreeClose<CR>"},
    {"<Tab>", ":tabnext<CR>"},
    {"t", ":tabedit<CR>"},
    {"<A-r>", ":w<CR>:tabedit<CR>:terminal fish -c run_less<CR>i"},
    {"<A-b>", ":w<CR>:tabedit<CR>:terminal fish -c build_less<CR>i"},
    {"<A-t>", ":w<CR>:tabedit<CR>:terminal fish -c test_less<CR>i"},
    {"<C-Left>", ":vertical resize +1<CR>"},
    {"<C-Right>", ":vertical resize -1<CR>"},
    {"<C-Up>", ":resize -1<CR>"},
    {"<C-Down>", ":resize +1<CR>"},
    {"<S-Up>", ":set splitbelow<CR>:split<CR>"},
    {"<S-Right>", ":set splitright<CR>:vsplit<CR>"},
    {"<S-Down>", ":set splitbelow&<CR>:split<CR>"},
    {"<S-Left>", ":set splitright&<CR>:vsplit<CR>"},
    {"q", ":q<CR>"},
    {"Q", ":quitall!<CR>"},
    {"w", ":w<CR>"},
    {"<S-Tab>", ":tabNext<CR>"},
    {"e", ":e "},
    {"F", ":normal za<CR>"},
    {"B", ":buffers<CR>"},
    {"b", ":buffer"},
    -- Double the size of the indent, so make 2 spaces 4
    {"c<Space>", ":%s/^\\( *\\)/\\1\\1/g<CR>:noh<CR>"},
    -- Half the size of the indent, so make 4 spaces 2 (really cool regex right here)
    {"C<Space>", ":%s/^\\( *\\)\\1/\\1/g<CR>:noh<CR>"},
    -- execute :noh
    {"nh", ":noh<CR>"},
}
for i, binding in ipairs(normal_maps) do
    vim.keymap.set("n", binding[1], binding[2], binding[3])
end

-- Diagnostic opts
local diagnostic_opts = {
    noremap=true,
    silent=true,
}
local diagnostic_maps = {
    {"<F2>", vim.diagnostic.open_float, diagnostic_opts},
    {"<F3>", vim.diagnostic.setloclist, diagnostic_opts},
    {"<F4>", vim.diagnostic.show, diagnostic_opts},
    {"<M-Left>", vim.diagnostic.goto_prev, diagnostic_opts},
    {"<M-Right>", vim.diagnostic.goto_next, diagnostic_opts},
}
for i, binding in ipairs(diagnostic_opts) do
    vim.keymap.set("n", binding[1], binding[2], binding[3])
end

-- copy and paste with the system clipboard
local normal_visual_maps = {
    {"p", '"+p'},
    {"P", '"+P'},
    {"Y", '"+Y'},
    {"y", '"+y'},
    {"d", '"+d'},
    {"D", '"+D'},
    {"x", '"+x'},
}
for i, binding in ipairs(normal_visual_maps) do
    vim.keymap.set({"n", "v"}, binding[1], binding[2], binding[3])
end


-- Maps for visual mode
local visual_maps = {
    {"<C-/>", ":CommentToggle<CR>"},
}
for i, binding in ipairs(visual_maps) do
    vim.keymap.set("v", binding[1], binding[2], binding[3])
end
