local map = nvchad.map
local telescope = require "telescope"
local M = {}

function M.setup()
   telescope.load_extension "neoclip"

   require("neoclip").setup {
      history = 1000,
      enable_persistent_history = true,
      continious_sync = true,
      db_path = vim.fn.stdpath "data" .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      default_register = '"',
      default_register_macros = "q",
      enable_macro_history = true,
      content_spec_column = false,
      on_paste = {
         set_reg = false,
      },
      on_replay = {
         set_reg = false,
      },
      keys = {
         telescope = {
            i = {
               select = "<cr>",
               paste = "<c-v>",
               paste_behind = "<c-V>",
               replay = "<c-q>", -- replay a macro
               delete = "<c-d>", -- delete an entry
               custom = {},
            },
            n = {
               select = "<cr>",
               paste = "p",
               paste_behind = "P",
               replay = "q",
               delete = "d",
               custom = {},
            },
         },
      },
   }

   map("n", "<leader>fcp", "<cmd>lua require 'telescope'.extensions.neoclip.neoclip()<cr>")
end

return M
