local pluginConfs = require "custom.plugins.configs"
local userPlugins = require "custom.plugins"

local M = {}

M.ui = {
   theme = "catppuccin",
}

M.mappings = {
   terminal = {
      -- show & recover hidden terminal buffers in a telescope picker
      pick_term = "<leader>tW",

      -- spawn a single terminal and toggle it
      -- this just works like toggleterm kinda
      new_horizontal = "<leader>th",
      new_vertical = "<leader>tv",

      -- spawn new terminals
      spawn_horizontal = "<leader>tH",
      spawn_vertical = "<leader>tV",
      spawn_window = "<leader>tw",
   },
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
   },
}

return M
