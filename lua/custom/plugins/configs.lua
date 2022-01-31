local M = {}

-- overriding default plugin configs!
M.treesitter = {
   ensure_installed = {
      "css",
      "dart",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "org",
      "python",
      "toml",
      "typescript",
      "vim",
      "yaml",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
}

return M
