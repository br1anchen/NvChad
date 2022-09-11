local userPlugins = require "custom.plugins"
local userHighlights = require "custom.highlights"

require "custom.cmd"

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

M.plugins = {
  user = userPlugins,

  status = {
    colorizer = true,
    snippets = true,
    alpha = true, -- dashboard
  },
}

return M
