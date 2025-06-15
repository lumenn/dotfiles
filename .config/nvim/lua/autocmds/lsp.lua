local servers = {
    terraform = require('lsp.servers.terraformls'),
}

vim.api.nvim_create_autocmd({ 'VimEnter', 'FileType' }, {
    pattern = '*',
    callback = function(args)
        local server = servers[vim.bo[args.buf].filetype]
        if server then vim.lsp.start(server) end
    end
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = { 'docker-compose.yaml', 'docker-compose.yml' },
    callback = function ()
        vim.bo.filetype = 'yaml.docker-compose'
    end
})
