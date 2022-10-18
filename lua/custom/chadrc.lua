local userPlugins = require "custom.plugins"
local userHighlights = require "custom.highlights"

require "custom.cmd"

vim.opt.relativenumber = true

local M = {}

M.ui = {
  theme = "catppuccin",

  hl_add = userHighlights.add,
  hl_override = userHighlights.override,
}

M.mappings = {
  disabled = {
    n = {
      ["<leader>q"] = "",
    },
    t = {
      ["<C-x>"] = "",
    },
  },
}

M.plugins = userPlugins

return M
