local M = {}

-- overriding default plugin configs!
M.packer = {
  max_jobs = 10,
}

M.treesitter = {
  ensure_installed = {
    "css",
    "dart",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "latex",
    "lua",
    "markdown",
    "nix",
    "python",
    "query",
    "rust",
    "swift",
    "toml",
    "typescript",
    "vim",
    "yaml",
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
    "texlab",
    "tsserver",
    "yamlls",
    "marksman",
    "sourcekit",
  },
  automatic_installation = false,
}

M.telescope = {
  extensions_list = {
    "dap",
    "file_browser",
    "flutter",
    "git_worktree",
    "neoclip",
    "terms",
    "themes",
    "workspaces",
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
    { name = "copilot" },
    { name = "nvim_lsp" },
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
