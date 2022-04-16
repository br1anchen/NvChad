local map = require("core.utils").map
local M = {}

function M.setup()
   require("trouble").setup {}

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
   map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
   map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
   map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
   map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
   -- vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
end

return M
