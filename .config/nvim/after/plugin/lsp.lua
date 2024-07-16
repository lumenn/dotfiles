local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnips' }
    }, {
        { name = 'buffer' },
    })

})

require('mason').setup({
    ui = {border = 'rounded'}
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'sqls',
        'tsserver',
        'html',
        'terraformls',
        'tflint',
        'lua_ls',
        'pyright',
        'ansiblels',
        'jinja_lsp'
    }

})

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = { "lua_ls", "html", "terraformls", "tflint", "hyprls", "ansiblels", "jinja_lsp" }
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

