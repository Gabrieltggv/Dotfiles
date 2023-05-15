local vim = vim
local packer_path = "/site/pack/packer/start/packer.nvim"
local install_path = vim.fn.stdpath("data") .. packer_path

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    local repo = "https://github.com/wbthomason/packer.nvim"
    local clone = { "git", "clone", "--depth", "1", repo, install_path }
    PackerBboostraped = vim.fn.system(clone)
end

vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


local start_apps = function(use)
    use({ "wbthomason/packer.nvim" })
    use({
        "neovim/nvim-lspconfig",
        requires = { { "williamboman/nvim-lsp-installer" } },
        config = function()
            require("config.lsp")
        end,
    })
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            "f3fora/cmp-spell",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "quangnguyen30192/cmp-nvim-tags",
            "ray-x/cmp-treesitter",
            "lukas-reineke/cmp-rg",
            "petertriho/cmp-git",
        },
        config = function()
            require('config.cmp')
        end,
    })
    use({
        'L3MON4D3/LuaSnip',
        config = function()
            require('config.snnipet')
        end,
    })
    use({ 'saadparwaiz1/cmp_luasnip' })
    use(
        {
            'rafamadriz/friendly-snippets',
            event = 'InsertCharPre'
        }
    )
    use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config.nvimtree')
        end,
    })
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' }
        },
        event = 'VimEnter',
        config = function()
            require('config.telescope')
        end,
    })
    use({
        'rcarriga/nvim-notify',
        config = function()
            require('config.notifications')
        end,
    })
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('config.treesitter')
        end,
    })
    --    use({ 'nvim-treesitter/playground' })
    use({ "ellisonleao/glow.nvim", branch = 'main' })
    use({
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config.buferline')
        end,
    })
    use({
        "nvim-lualine/lualine.nvim",
        after = "github-nvim-theme",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("config.lline")
        end,
    })
    use({
        "projekt0n/github-nvim-theme",
        config = function()
            require("config.themegithub")
        end,
    })
    -- use({
    --     'mfussenegger/nvim-jdtls',
    --     config = function()
    --         require('config.java')
    --     end,
    -- })
    --    use ({
    --      'sudormrfbin/cheatsheet.nvim',
    --      requires = {
    --        {'nvim-telescope/telescope.nvim'},
    --        {'nvim-lua/popup.nvim'},
    --        {'nvim-lua/plenary.nvim'},
    --      },
    --    })
    --    use({
    --        'norcalli/nvim-colorizer.lua',
    --        config = function()
    --            require('colorizer').setup()
    --        end,
    --    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup()
        end,
    })
    use({
        "lewis6991/gitsigns.nvim",
         requires = { "nvim-lua/plenary.nvim" },
         config = function()
           require('gitsigns').setup()
         end,
    })
    use({
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').get_icons()
            require('nvim-web-devicons').setup({
                default = true,
            })
        end,
    })
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    })
    --    use({
    --        'mattn/emmet-vim',
    --    })
    --    -- Mostra linhas de indentação
    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                show_current_context = true
            }
        end,
    })
    use ({
        'ray-x/lsp_signature.nvim',
        config = function()
            require ('lsp_signature').setup()
        end,
    })
    use({
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("config.flutter")
        end,
    })
    --    use({
    --        "Pocco81/DAPInstall.nvim",
    --        commit = "24923c3"
    --    })
    --    use({
    --        "mfussenegger/nvim-dap",
    --        requires = {
    --            "theHamsta/nvim-dap-virtual-text",
    --            "rcarriga/nvim-dap-ui",
    --            "mfussenegger/nvim-dap-python",
    --            "folke/which-key.nvim",
    --            "nvim-telescope/telescope-dap.nvim",
    --            { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    --        },
    --        config = function()
    --            require("config.dapl")
    --        end,
    --    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config.null")
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })
end

return require('packer').startup(start_apps)
