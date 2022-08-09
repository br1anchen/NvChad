local M = {}

-- overriding default plugin configs!
M.treesitter = {
  ensure_installed = {
    "css",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "lua",
    "markdown",
    "nix",
    "python",
    "rust",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },

  highlight = {
    disable = { "dart" },
  },
}

M.nvimtree = {
  git = { enable = true },
  view = { side = "right", width = 20 },
}

M.colorizer = {
  filetypes = {
    "*",
    dart = { AARRGGBB = true },
  },
  user_default_options = {
    mode = "virtualtext",
  },
}

M.mason_lspconfig = {
  ensure_installed = {
    "bashls",
    "dartls",
    "html",
    "jsonls",
    "lemminx",
    "prismals",
    "pyright",
    "rnix",
    "rust_analyzer",
    "sqls",
    "stylelint_lsp",
    "sumneko_lua",
    "taplo",
    "tsserver",
    "yamlls",
    "marksman",
  },
  automatic_installation = false,
}

M.telescope = {
  extensions_list = {
    "themes",
    "terms",
    "flutter",
    "workspaces",
    "dap",
    "neoclip",
    "file_browser",
  },
}

M.whichkey = {
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
    t = { "j", "k", "<space>" },
  },
}

M.gitsigns = {
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr" },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "cmp_tabnine" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "emoji" },
    { name = "path" },
    { name = "crates" },
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.1,
        col = 0.25,
        width = 0.5,
        height = 0.7,
        border = "single",
      },
    },
  },
}

M.mason = {
  ensure_installed = {},
}

return M
