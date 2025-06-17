return {
    {
	'williamboman/mason.nvim',
	config = function()
	    require('mason').setup()
	end,
    },
    {
	'williamboman/mason-lspconfig.nvim',
	opts = {
	    ensure_installed = {
		"lua_ls",
		"pyright",
		"terraformls",
		"rust_analyzer",
		"dockerls",
		"hadolint",
		"docker_compose_language_service",
		-- Golang
		"gopls",
		"goimports",
		"gofumpt",
		"gomodifytags",
		"impl",
		"delve",
		"nvim-dap-go"
	    }
	},
    },
    {
	'neovim/nvim-lspconfig',
    }
}
