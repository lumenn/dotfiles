require('mason').setup({
    ui = {border = 'rounded'}
})

local servers = {
    'sqls',
    'html',
    'terraformls',
    'tflint',
    'lua_ls',
    'hyprls',
    'pyright',
    'ansiblels',
    'jinja_lsp',
    'taplo',
    'rust_analyzer',
    'gopls',
    'ts_ls',
    'denols'
}

require('mason-lspconfig').setup({
    ensure_installed = servers
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers {
  function (server_name)
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    lspconfig[server_name].setup { capabilities = capabilities }
  end,
  denols = function ()
    lspconfig.denols.setup({
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      single_file_support = false
    })
  end,
  ts_ls = function()
    lspconfig.ts_ls.setup({
      root_dir = lspconfig.util.root_pattern("package.json"),
      single_file_support = false
    })
  end,
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
