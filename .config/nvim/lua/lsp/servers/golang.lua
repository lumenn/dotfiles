local util = require('lspconfig.util')

return {
    name = 'gopls',
    cmd = { 'docker-langserver', '--stdio' },
    filetypes = { 'dockerfile' },
    root_dir = util.root_pattern('Dockerfile'),
    single_file_support = true
}

		-- "goimports",
		-- "gofumpt",
		-- "gomodifytags",
		-- "impl",
		-- "delve",
		-- "nvim-dap-go"
