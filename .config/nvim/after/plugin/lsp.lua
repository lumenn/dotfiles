require('mason').setup({
    ui = {border = 'rounded'}
})

local servers = {
    'sqls',
    'tsserver',
    'html',
    'terraformls',
    'tflint',
    'lua_ls',
    'hyprls',
    'pyright',
    'ansiblels',
    'jinja_lsp',
    'taplo',
    'rust_analyzer'
}

require('mason-lspconfig').setup({
    ensure_installed = servers
})

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.tf", "*.tfvars"},
    callback = function()
        vim.lsp.buf.format()
    end,
})


vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.hl", "hypr*.conf"},
    callback = function()
        vim.lsp.start {
            name = "hyprlang",
            cmd = {"hyprls"},
            root_dir = vim.fn.getcwd(),
        }
    end,
})

