require("keymaps")
require("autocommands")


-- helpers
local opt=vim.opt
local globals=vim.g
local plugins=require("plugins")
local keymap_opts = {
    noremap=true,
    silent=true,
}


opt.syntax="on"

-- indent things
opt.shiftwidth=4
opt.tabstop=4
opt.expandtab=true

-- max width of the lines
opt.textwidth=100

-- figure out what this does (has to be for a
-- reason)
opt.formatoptions.o=true
--
-- enable number column
opt.number=true 

-- disable wrap
opt.wrap=false
-- opt.wrap=true
-- opt.linebreak=true

-- auto enable mouse support
opt.mouse="a"

-- error/warning/info column.
-- hidden till there are things to show, but not
-- more than 2 things at a time
opt.signcolumn="auto:2"

-- treesitter folds (DISABLED)
-- opt.foldmethod="expr"
-- opt.foldexpr="nvim_treesitter#foldexpr()"

-- chars to keep on the left/right of the cursor in long lines
opt.sidescrolloff=20


-- plugin config things
-- indent-blankline
require("indent_blankline").setup {
    char = "┊",
    show_current_context = false,
    show_current_context_start = false,
    char_highlight_list = {
        "rainbowcol1",
        "rainbowcol2",
        "rainbowcol3",
        "rainbowcol4",
        "rainbowcol5",
        "rainbowcol6",
        "rainbowcol7",
    },
}

-- rest.nvim
local rest_nvim=require("rest-nvim")
rest_nvim.setup{
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Keep the http file buffer above|left when split horizontal|vertical
    result_split_in_place = false,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = false,
    -- Encode URL before making request
    encode_url = true,
    -- Highlight request on run
    highlight = {
        enabled = true,
        timeout = 150,
    },
    result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
            json = false,
            html = false,
        },
    },
    -- Jump to request line on run
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true,
}
vim.keymap.set('n', '<M-Space>', "<Plug>RestNvim", keymap_opts)

-- treesitter
require("nvim-treesitter.configs").setup {
    highlight={
        enable=true,
    },
    rainbow={
        enable=true,
        max_file_lines=nil,
    },
    indent={
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
parser_config.docbuilder={
    install_info={
        url="~/projects/languages/tree-sitter-docbuilder",
        files={"src/parser.c","src/scanner.c"},
        generate_requires_npm=false,
        requires_generate_from_grammar=false,
    },
    filetype="docbuild",
}
parser_config.sexpression={
    install_info={
        url="~/projects/languages/tree-sitter-sexpression",
        files={"src/parser.c","src/scanner.c"},
        generate_requires_npm=false,
        requires_generate_from_grammar=false,
    },
    filetype="sexpression",
}
local treesitter_queries=require("vim.treesitter.query")

-- spellsitter (treesitter-aware spell checking)
local spellsitter=require("spellsitter")
spellsitter.setup()

-- LSP configs
local lspconfig=require("lspconfig")
-- lspconfig.denols.setup{}
lspconfig.tsserver.setup{}
-- lspconfig.graphql.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.svls.setup{}
-- lspconfig.hdl_checker.setup{}

-- nvim-comment
local commenter=require("nvim_comment").setup({
    marker_padding=true,
    comment_empty=false,
    create_mappings=false,
})

-- airline theme stuff
globals.airline_powerline_fonts=true
globals.airline_mode_map={
    ["__"]="-",
    ["c"]="C",
    ["i"]="I",
    ["ic"]="I",
    ["ix"]="I",
    ["n"]="N",
    ["ni"]="N",
    ["no"]="N",
    ["R"]="R",
    ["Rv"]="R",
    ["s"]="S",
    ["S"]="S",
    ["^S"]="S",
    ["t"]="T",
    ["v"]="V",
    ["V"]="V",
    ["^V"]="V",
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
    if exists("b:NERDTree") && b:NERDTree.isTabTree()
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

-- nvim-surround
local nvim_surround=require("nvim-surround")
nvim_surround.setup()


-- misc
vim.cmd("hi SpellCap ctermbg=17 gui=undercurl guisp=Blue")
vim.cmd("hi SpellBad ctermbg=88 gui=undercurl guisp=Red")
