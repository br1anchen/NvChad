local pluginConfs = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"
local userHighlights = require "custom.highlights"

local M = {}

M.ui = {
   theme = "catppuccin",

   hl_override = userHighlights,
}

M.mappings = {
   misc = function()
      require "custom.mappings"
   end,
}

M.plugins = {
   user = userPlugins,

   status = {
      colorizer = true,
      snippets = true,
      alpha = true, -- dashboard
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
      ["NvChad/nvim-colorizer.lua"] = pluginConfs.colorizer,
      ["NvChad/nvterm"] = pluginConfs.nvterm,
      ["williamboman/nvim-lsp-installer"] = pluginConfs.lsp_installer,
   },
}

return M
