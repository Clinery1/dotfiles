require("keymaps")
require("autocommands")


-- helpers
local opt=vim.opt
local globals=vim.g
local plugins=require("plugins")


opt.syntax="on"
-- indent things
opt.shiftwidth=4
opt.tabstop=4
opt.expandtab=true
-- figure out what this does (has to be for a
-- reason)
opt.formatoptions.o=true
opt.number=true -- enable number column
-- disable wrap
opt.wrap=false
-- auto enable mouse support
opt.mouse="a"
-- error/warning/info column.
-- hidden till there are things to show, but not
-- more than 2 things at a time
opt.signcolumn="auto:2"


-- plugin config things
-- treesitter
require'nvim-treesitter.configs'.setup {
    highlight={
        enable=true,
    },
}
local parser_config=require("nvim-treesitter.parsers").get_parser_configs()
parser_config.cppl={
    install_info={
        url="~/projects/languages/tree-sitter-cppl",
        files={"src/parser.c","src/scanner.c"},
        generate_requires_npm=false,
        requires_generate_from_grammar=false,
    },
    filetype="cppl",
}
local treesitter_queries=require("vim.treesitter.query")

-- LSP configs
local lspconfig=require("lspconfig")
lspconfig.denols.setup{}
lspconfig.rls.setup{}
lspconfig.svls.setup{}

-- nvim-comment
local commenter=require('nvim_comment').setup({
    marker_padding=true,
    comment_empty=false,
    create_mappings=false,
})

-- airline theme stuff
globals.airline_powerline_fonts=true
globals.airline_mode_map={
    ["__"]='-',
    ["c"]='C',
    ["i"]='I',
    ["ic"]='I',
    ["ix"]='I',
    ["n"]='N',
    ["ni"]='N',
    ["no"]='N',
    ["R"]='R',
    ["Rv"]='R',
    ["s"]='S',
    ["S"]='S',
    ["^S"]='S',
    ["t"]='T',
    ["v"]='V',
    ["V"]='V',
    ["^V"]='V',
}
globals.airline_section_x=""
vim.cmd("let g:airline#extensions#tabline#enabled=1")   -- there is no obvious alternative, so we are just running a vimscript command


-- nerdtree
globals.NERDTreeWinSize=20
globals.NERDTreeWinPos="right"
globals.NERDTreeCustomOpenArgs={
    file={
        reuse="all",
        where="t",
        keepopen=1,
    },
}
vim.cmd([[
function SwitchNerdTree()
    if exists('b:NERDTree') && b:NERDTree.isTabTree()
        wincmd p
        echo "Left NERDTree"
    else
        NERDTreeFocus
        echo "Entered NERDTree"
    endif
endfunction
]])


-- nebulous (color theme)
require("nebulous").setup {
    variant="night",
    disable={
        background=true,
        endOfBuffer=false,
        terminal_colors=false,
    },
    italic={
        builtins=true,
        comments=false,
        keywords=true,
        functions=false,
        variables=false,
    },
}


-- misc
vim.cmd("hi SpellCap ctermbg=17 gui=undercurl guisp=Blue")
vim.cmd("hi SpellBad ctermbg=88 gui=undercurl guisp=Red")
