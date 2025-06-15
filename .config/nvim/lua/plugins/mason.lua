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
		"docker_compose_language_service"
	    }
	},
    },
    {
	'neovim/nvim-lspconfig',
    }
}
