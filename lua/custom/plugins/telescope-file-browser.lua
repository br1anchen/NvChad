local map = require("core.utils").map
local telescope = require "telescope"
local M = {}

function M.setup()
   telescope.load_extension "file_browser"

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>fp", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
end

return M
