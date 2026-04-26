vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>wq', ':write<CR> :quit<CR>')
vim.keymap.set('n', '<leader>m', ':Mason<CR>')

vim.pack.add({
	-- Finder
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	-- Theme
	{ src = "https://github.com/LunarVim/horizon.nvim" },
	-- Git
	{ src = "https://github.com/voldikss/vim-floaterm" },
	-- LSP
	{ src = "https://github.com/mason-org/mason.nvim" },
	-- Completion
	{ src = "https://github.com/Saghen/blink.cmp" },
	-- File explorer
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	-- Debug adapter
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	-- AI
	{ src = "https://github.com/yetone/avante.nvim" }
})
vim.cmd("colorscheme horizon")
vim.cmd("set completeopt+=noselect")

local builtin = require "telescope.builtin"
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Git
vim.keymap.set('n', '<leader>g', '<cmd>FloatermNew --height=0.9 --width=0.9 lazygit<CR>', { desc = 'Git in Floaterm' })

-- LSP
require "mason".setup()

vim.lsp.enable({
	"lua_ls",
	"gopls",
	"dockerls",
	"marksman",
	"pyright",
	"svelte",
	"denols",
	"yamlls",
	"tofuls",
	"ansiblels",
	"fish_lsp",
})
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- Autocompletion
require "blink.cmp".setup({
	keymap = { preset = 'default' },
	appearance = {
		nerd_font_variant = 'mono',
	},
	completion = {
		menu = {
			draw = {
				columns = {
					{ "kind_icon", gap = 1 },
					{ "label",     "label_description" },
				},
			}
		},
		documentation = {
			auto_show = true,
		},
	},
	fuzzy = {
		implementation = 'lua'
	},
	signature = {
		enabled = true
	}
})

-- Treesitter
require "nvim-treesitter.configs".setup({
	ensure_installed = {
		"lua",
		"dockerfile",
		"go",
		"html",
		"json",
		"yaml",
		"markdown",
		"markdown_inline",
		"python",
		"sql",
		"svelte",
		"typescript",
		"javascript",
		"fish",
		"toml",
	},
	highlight = { enable = true },
	modules = {},
	sync_install = false,
	auto_install = true,
	ignore_install = {},
})

-- file explorer
vim.keymap.set("n", "<leader>e", function()
	require "yazi".yazi()
end)

-- dap
require "dapui".setup()
