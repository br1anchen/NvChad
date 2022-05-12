local map = nvchad.map
local M = {}

function M.setup()
   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>zb", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
   map("n", "<leader>zc", ":lua require'dap'.continue()<cr>", opts)
   map("n", "<leader>zo", ":lua require'dap'.step_over()<cr>", opts)
   map("n", "<leader>zi", ":lua require'dap'.step_into()<cr>", opts)
   map("n", "<leader>zr", ":lua require'dap'.repl.open()<cr>", opts)
   map("n", "<leader>zn", ":lua require('dapui').toggle('sidebar')<cr>", opts)
   map("n", "<leader>zk", ":lua require('dapui').eval()<cr>", opts)
   map("n", "<leader>zl", ":10sp | buffer \\[dap-repl]<cr>", opts)
end

return M
