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
    config = function()
      require('config.cmp')
    end,
  })
end

return require('packer').startup(start_apps)
