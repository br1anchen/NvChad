local ok, iron = pcall(require, "iron")

if not ok then
   return
end

local M = {}

M.setup = function()
   iron.core.setup {
      config = {
         preferred = {
            python = "ipython",
         },
      },
   }
end

return M
