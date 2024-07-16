local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	'folke/which-key.nvim',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},
    -- theme
	'akinsho/horizon.nvim',
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate"
	},
    -- language server
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
    -- autocomplete
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
    -- snippets
	{'L3MON4D3/LuaSnip'},
    {'m4xshen/autoclose.nvim'},
})

