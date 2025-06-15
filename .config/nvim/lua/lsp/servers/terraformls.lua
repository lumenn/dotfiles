return {
    name = 'terraformls',
    cmd = { 'terraform-ls', 'serve' },
    filetypes = { 'terraform', 'tf' },
    root_markers = { '.terraform', '.git', '*.tf' }
}
