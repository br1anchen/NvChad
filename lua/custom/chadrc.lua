local pluginConfs = require "custom.plugins.configs"
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

  override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["NvChad/nvim-colorizer.lua"] = pluginConfs.colorizer,
    ["NvChad/nvterm"] = pluginConfs.nvterm,
    ["williamboman/nvim-lsp-installer"] = pluginConfs.lsp_installer,
    ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
    ["folke/which-key.nvim"] = pluginConfs.whichkey,
    ["lewis6991/gitsigns.nvim"] = pluginConfs.gitsigns,
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
    ["williamboman/mason.nvim"] = pluginConfs.mason,
  },
}

return M
