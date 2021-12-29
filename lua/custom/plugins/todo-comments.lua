local todo = require "todo-comments"
local map = require("core.utils").map
local M = {}

function M.setup()
   todo.setup()

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>ftd", ":TodoTelescope<CR>", opts)
   map("n", "<leader>xt", ":TodoTrouble<CR>", opts)
end

return M
