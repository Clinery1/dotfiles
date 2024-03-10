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
opt.showtabline = 0

-- brightens the line the cursor is on
opt.cursorline=true

-- indent things
opt.shiftwidth=4
opt.tabstop=4
opt.expandtab=true

-- max width of the lines
opt.textwidth=100

-- figure out what this does (has to be for a reason)
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


-- neovide
vim.o.guifont = "Mononoki Nerd Font Mono"
vim.g.neovide_scale_factor = 0.8
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_unlink_border_highlights = true
vim.g.neovide_cursor_animation_length = 0.05


-- plugin config things
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


-- indent-blankline
require("ibl").setup {
    -- show_current_context = false,
    -- show_current_context_start = false,
    indent = {
        char = "┊",
        highlight = {
            "rainbowcol1",
            "rainbowcol2",
            "rainbowcol3",
            "rainbowcol4",
            "rainbowcol5",
            "rainbowcol6",
            "rainbowcol7",
        },
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        highlight = {
            "rainbowcol1",
            "rainbowcol2",
            "rainbowcol3",
            "rainbowcol4",
            "rainbowcol5",
            "rainbowcol6",
            "rainbowcol7",
        },
        char = "│",
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
    env_file = ".env",
    custom_dynamic_variables = {},
    yank_dry_run = true,
}
vim.keymap.set("n", "<M-Space>", "<Plug>RestNvim", keymap_opts)


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
-- local spellsitter=require("spellsitter")
-- spellsitter.setup()


-- LSP configs
vim.diagnostic.config{
    update_in_insert = false,
};
local lspconfig=require("lspconfig")
-- lspconfig.denols.setup{}
-- lspconfig.tsserver.setup{}
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


-- lualine theme stuff
--- A simple funciton to create the `Tab N/N` text for the windowline
local function lualine_tab_number()
    local tab_num = vim.fn.tabpagenr()
    local tab_count = #vim.fn.gettabinfo()

    return "Tab "..tab_num.."/"..tab_count
end
local lualine_winbar = {
    lualine_a = {lualine_tab_number, "filename"},
    lualine_b = {"filetype"},
    lualine_c = {"fileformat", "diagnostics"},
    lualine_x = {"encoding"},
    lualine_y = {"progress"},
    lualine_z = {"location"},
}
require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        section_separators = { left = "", right = ""},
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {
            {
                "datetime",
                style = "%H:%M",
            },
        },
        lualine_c = {"branch"},
        lualine_x = {"searchcount"},
        lualine_y = {},
        lualine_z = {
            {
                "tabs",
                mode = 2,
                path = 1,
                max_length = (vim.o.columns / 4)*3,
            },
        }
    },
    inactive_sections = {},
    winbar = lualine_winbar,
    inactive_winbar = lualine_winbar,
    extensions = {}
}


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


-- nvim-surround
local nvim_surround=require("nvim-surround")
nvim_surround.setup()


-- misc
vim.cmd("hi SpellCap ctermbg=17 gui=undercurl guisp=Blue")
vim.cmd("hi SpellBad ctermbg=88 gui=undercurl guisp=Red")
