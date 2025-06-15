local util = require('lspconfig.util')

return {
    name = 'dockerls',
    cmd = { 'docker-langserver', '--stdio' },
    filetypes = { 'dockerfile' },
    root_dir = util.root_pattern('Dockerfile'),
    single_file_support = true
}
