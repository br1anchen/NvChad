local M = {}

function M.setup()
   require("neoclip").setup {
      history = 1000,
      continious_sync = true,
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
end

return M
