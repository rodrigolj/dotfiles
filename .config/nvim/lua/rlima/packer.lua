vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use { "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } } }
    use "ThePrimeagen/harpoon"
    use "tpope/vim-fugitive"
    use { "catppuccin/nvim", as = "catppuccin" }
    use "mbbill/undotree"
    use "nvim-lualine/lualine.nvim"
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
        }
    }
    use 'norcalli/nvim-colorizer.lua'
    use { 'junegunn/fzf.vim', dir = '~/bin/fzf', run = './install -all' }
    use 'vijaymarupudi/nvim-fzf'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'virchau13/tree-sitter-astro'
    use 'BurntSushi/ripgrep'
    use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use 'prettier/vim-prettier'
end)
