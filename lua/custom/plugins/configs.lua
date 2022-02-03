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
      "org",
      "python",
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

return M
