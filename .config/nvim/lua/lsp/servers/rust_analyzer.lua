return {
    name = 'rust_analyzer',
    cmd = { 'terraform-ls', 'serve' },
    filetypes = { 'terraform', 'tf' },
    root_markers = { '.terraform', '.git', '*.tf' }
}
