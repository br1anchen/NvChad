local ok, litee = pcall(require, "litee.lib")

if not ok then
   return
end

local M = {}

M.setup = function()
   litee.setup {
      tree = {
         icon_set = "nerd",
      },
      panel = {
         orientation = "bottom",
         panel_size = 30,
      },
   }
end

return M
