-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	-- Lualine, colorsheme, comforeditor, fzf neovim,
	spec = {

		--Neotree
		{
			'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'	
		},		
		{
			"nvim-neo-tree/neo-tree.nvim",
		  branch = "v3.x",
		  dependencies = {
		    "nvim-lua/plenary.nvim",
		    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		    "MunifTanjim/nui.nvim",
		    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		  }	
		},

		-- LSP Setup
			{'neoclide/coc.nvim', branch = 'release'},
		-- status Line
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		
		-- Colorscheme
		{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

		-- add your plugins here
	},	
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "moonfly" } },
	-- automatically check for plugin updates
	checker = { enabled = true },

})


-- Coc settings
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-git',
  'coc-css',
  'coc-html',
  'coc-tailwindcss',
  'coc-tsserver',
  'coc-react-refactor',
  'coc-pyright',
  'coc-rust-analyzer'

}


vim.cmd(":set number")


--Custom Keybind

--local keyset = vim.key.set 
