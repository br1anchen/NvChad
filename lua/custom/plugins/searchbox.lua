local map = nvchad.map
local M = {}

function M.setup()
   require("searchbox").setup {}

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>s", '<cmd>lua require("searchbox").incsearch()<CR>', opts)
   map("v", "<leader>s", '<Esc><cmd>lua require("searchbox").incsearch({visual_mode = true})<CR>', opts)
   map("n", "<leader>sr", '<cmd>lua require("searchbox").replace({confirm = "menu"})<CR>', opts)
end

return M
