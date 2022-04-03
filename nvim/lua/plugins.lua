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
	use({"wbthomason/packer.nvim"})
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("config.themegithub")
		end
	})
    use({ 'hrsh7th/cmp-nvim-lsp' })
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
            'nvim-lua/plenary.nvim',
			"quangnguyen30192/cmp-nvim-tags",
			"ray-x/cmp-treesitter",
			"lukas-reineke/cmp-rg",
			"petertriho/cmp-git",
		},
        config = function()
            require('config.cmp')
        end,
    })
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
    use({ 'hrsh7th/cmp-vsnip' })
    use({ 'hrsh7th/vim-vsnip' })
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
    use({ 'nvim-treesitter/playground' })
    use({
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
			require("config.buferline")
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
    use ({
      'sudormrfbin/cheatsheet.nvim',
      requires = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      },
    })
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup()
        end,
    })
end

return require('packer').startup(start_apps)
