local vim = vim
local function set_globals()
	vim.g.mapleader = " "
    vim.cmd("set guifont=Cascadia\\ Code\\ Light,Hack\\ Nerd\\ Font")
end

local function set_mappings()
	local opts = { noremap = true }
	local mappings = {
		{ "n", "<leader>,", "<Cmd>nohl<CR>", opts },
		{ "n", "<leader>ls", "'0<CR>", opts },
		{ "n", "<leader>s", "viw<esc>a'<esc>bi'<esc>lel", opts },
		{ "", ">", ">gv", {} },
		{ "", "<", "<gv", {} },
		{ "n", "<C-j>", ":m .+1<CR>==", opts },
		{ "n", "<C-k>", ":m .-2<CR>==", opts },
        { "v", "J", ":m '>+1<CR>gv=gv", opts },
		{ "v", "K", ":m '<-2<CR>gv=gv", opts },
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
        list = true,
        listchars = 'tab:→ ,trail:•,extends:»,precedes:«',
		expandtab = true,
		foldenable = false,
		hidden = true,
		ignorecase = true,
		mouse = "a",
		number = true,
        relativenumber = true,
		scrolloff = 5,
		shell = "/home/gabriel/.nix-profile/bin/fish",
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
