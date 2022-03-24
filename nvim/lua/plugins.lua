return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
end,
config = {
  package_root = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
})
