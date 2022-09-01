return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    use "sheerun/vim-polyglot"
    use "rust-lang/rust.vim"
    use "scrooloose/nerdtree"
    use "godlygeek/tabular"
    use "ryanoasis/vim-devicons"
    use "neovim/nvim-lspconfig"
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/nvim-treesitter"
    use "Clinery1/nebulous.nvim"
    use "terrortylor/nvim-comment"
    use "lewis6991/spellsitter.nvim"
    use "kylechui/nvim-surround"
end)
