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
      dart = { AARRGGBB = true },
   },
   user_default_options = {
      mode = "virtualtext",
   },
}

return M
