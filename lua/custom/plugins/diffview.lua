local ok, diffview = pcall(require, "diffview")

if not ok then
   return
end

local M = {}

M.setup = function()
   diffview.setup {}

   local map = nvchad.map
   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>do", "<cmd>DiffviewOpen origin/main...HEAD<cr>", opts)
   map("n", "<leader>ds", "<cmd>DiffviewOpen origin/master...HEAD<cr>", opts)
end

return M
