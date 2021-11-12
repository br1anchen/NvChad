-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

-- M.options = {
--    relativenumber = true,
-- }

-- M.ui = {
--   theme = "nord"
-- }
M.mappings = {
   close_buffer = "<leader>bd",
   terminal = {
      pick_term = "<leader>tW",
      -- below three are for spawning terminals
      new_horizontal = "<leader>th",
      new_vertical = "<leader>tv",
      new_window = "<leader>tw",
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
         themes = "<leader>fC", -- NvChad theme picker
         -- media previews within telescope finders
         telescope_media = {
            media_files = "<leader>fp",
         },
      },
   },
}

-- NvChad included plugin options & overrides
M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {},
}

return M
