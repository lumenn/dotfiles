local util = require('lspconfig.util')

return {
    name = 'docker_compose_language_service',
    cmd = { 'docker-compose-langserver', '--stdio' },
    filetypes = { 'yaml.docker-compose' },
    root_dir = util.root_pattern('docker-compose.yaml', 'docker-compose.yml', 'compose.yaml', 'compose.yml'),
    single_file_support = true,
}
