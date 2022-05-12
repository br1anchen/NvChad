local M = {}

-- overriding default plugin configs!
M.treesitter = {
   ensure_installed = {
      "css",
      "dart",
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

M.nvterm = {
   mappings = {
      toggle = {
         float = "<leader>tw",
         horizontal = "<leader>th",
         vertical = "<leader>tv",
      },
      new = {
         float = "<leader>tW",
         horizontal = "<leader>tH",
         vertical = "<leader>tV",
      },
   },
}

M.lsp_installer = {
   ensure_installed = {
      "bashls",
      "dartls",
      "html",
      "jsonls",
      "lemminx",
      "prismals",
      "rnix",
      "rust_analyzer",
      "sqls",
      "stylelint_lsp",
      "sumneko_lua",
      "taplo",
      "tsserver",
      "zk",
   },
   automatic_installation = false,
}

M.telescope = {
   extensions = {
      "themes",
      "terms",
      "flutter",
      "workspaces",
   },
}

return M
