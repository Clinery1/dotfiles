return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    use "sheerun/vim-polyglot"
    use "rust-lang/rust.vim"
    use "scrooloose/nerdtree"
    -- use "udalov/kotlin-vim"
    use "godlygeek/tabular"
    use "ryanoasis/vim-devicons"
    use "neovim/nvim-lspconfig"
    use "nvim-treesitter/nvim-treesitter"
    use "Yagua/nebulous.nvim"
end)
