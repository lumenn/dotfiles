require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "sql",
      "fish",
      "javascript",
      "typescript",
      "terraform",
      "python",
      "json",
      "html",
      "rust",
      "go"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>ss",
      node_incremental = "<Leader>si",
      node_decremental = "<Leader>sd"
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ra"] = "@assignment.rhs",
        ["la"] = "@assignment.lhs",
        ["of"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ol"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["oi"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["oc"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ob"] = "@block.outer",
        ["ib"] = "@block.inner",
      }
    }
  },
}

