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
      "dap",
      "neoclip",
      "file_browser",
   },
}

M.whichkey = {
   groups = {
      { ["<leader>v"] = { name = "+Window" } },
      { ["<leader>l"] = { name = "+LSP" } },
      { ["<leader>f"] = { name = "+Telescope" } },
      { ["<leader>a"] = { name = "+Asynctasks" } },
      { ["<leader>g"] = { name = "+Git" } },
      { ["<leader>o"] = { name = "+Octo review" } },
      { ["<leader>d"] = { name = "+Diffview" } },
      { ["<leader>z"] = { name = "+Debugger" } },
      { ["<leader>x"] = { name = "+Trouble" } },
      { ["<leader>s"] = { name = "+Search" } },
      { ["<leader>t"] = { name = "+Terminal" } },
   },
   triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      i = { "j", "k" },
      v = { "j", "k" },
      t = { "j", "k", "<space>" },
   },
}

return M
