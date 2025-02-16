local cmp = require('cmp')
local lspkind = require('lspkind')

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
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnips' },
        { name = 'path' },                              -- file paths
        { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 2 },        -- source current buffer
        { name = 'calc'},
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = function(entry, vim_item)
            local lspserver_name = "[LSP]"

            if entry.source.name == 'nvim_lsp' then
              pcall(function()
                lspserver_name = "[LSP - " .. entry.source.source.client.name .. "]"
              end)
            end

            vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = lspserver_name,
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            })[entry.source.name]

            vim_item = lspkind.cmp_format({
              mode = 'symbol_text',
              maxwidth = 50,
              ellipsis_char = '...',
              show_labelDetails = true
            })(entry, vim_item)

            return vim_item
          end
    }
})
