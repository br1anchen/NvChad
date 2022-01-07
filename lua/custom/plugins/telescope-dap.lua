local map = require("core.utils").map
local telescope = require "telescope"
local M = {}

function M.setup()
   telescope.load_extension "dap"

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>fd", ":Telescope dap commands<CR>", opts)
   map("n", "<leader>fdc", ":Telescope dap configurations<CR>", opts)
   map("n", "<leader>fdb", ":Telescope dap list_breakpoints<CR>", opts)
   map("n", "<leader>fdv", ":Telescope dap variables<CR>", opts)
   map("n", "<leader>fdf", ":Telescope dap frames<CR>", opts)
end

return M
