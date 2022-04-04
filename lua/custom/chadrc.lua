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
   plugins = {
      telescope = {
         buffers = "<leader>fb",
         find_files = "<leader>ff",
         find_hiddenfiles = "<leader>fa",
         git_commits = "<leader>fc",
         git_status = "<leader>fg",
         help_tags = "<leader>fh",
         live_grep = "<leader>ft",
         oldfiles = "<leader>fr",
         themes = "<leader>fv", -- NvChad theme picker
         -- media previews within telescope finders
         telescope_media = {
            media_files = "<leader>fp",
         },
      },
   },
}

M.plugins = {
   install = userPlugins,

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

   default_plugin_config_replace = {
      nvim_treesitter = pluginConfs.treesitter,
      nvim_tree = pluginConfs.nvimtree,
      nvim_colorizer = pluginConfs.colorizer,
   },
}

return M
