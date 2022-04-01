local function set_globals()
	vim.g.mapleader = " "
end

local function set_mappings()
	local opts = { noremap = true }
	local mappings = {
		{ "n", "<leader>,", "<Cmd>nohl<CR>", opts },
		{ "n", "<leader>ls", "'0<CR>", opts },
	}

	for _, val in pairs(mappings) do
		vim.api.nvim_set_keymap(unpack(val))
	end
end


local function set_options()
	local options = {
		autoindent = true,
		autoread = true,
		clipboard = "unnamed,unnamedplus",
		colorcolumn = "80,88,120",
		cursorline = true,
		swapfile = false,
        backup = false,
		expandtab = true,
		foldenable = false,
		hidden = true,
		ignorecase = true,
		mouse = "a",
		number = true,
		scrolloff = 5,
		shell = "/bin/fish",
		shiftwidth = 4,
		smartcase = true,
		smartindent = true,
		softtabstop = 4,
		splitbelow = true,
		splitright = true,
		tabstop = 4,
		termguicolors = true,
		wildignore = "*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite",
	}
	for key, val in pairs(options) do
		vim.opt[key] = val
	end
end

set_globals()
set_mappings()
set_options()
