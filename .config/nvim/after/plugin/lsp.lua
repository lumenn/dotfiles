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

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    require("lspconfig")[server_name].setup { capabilities = capabilities }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --   require("rust-tools").setup {}
  -- end
}

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
