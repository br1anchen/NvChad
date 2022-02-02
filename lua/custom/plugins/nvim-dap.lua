local map = require("core.utils").map
local M = {}
local dap_install = require "dap-install"

function M.setup()
   dap_install.config("dart", {
      adapters = {
         type = "executable",
         command = "node",
         args = { vim.fn.stdpath "data" .. "/dapinstall/dart-code/out/dist/debug.js", "flutter" },
      },
      configurations = {
         {
            type = "dart",
            request = "launch",
            name = "Launch flutter",
            dartSdkPath = os.getenv "HOME" .. "/snap/flutter/common/flutter/bin/cache/dart-sdk/",
            flutterSdkPath = os.getenv "HOME" .. "/snap/flutter/common/flutter",
            program = "${workspaceFolder}/lib/main.dart",
            cwd = "${workspaceFolder}",
         },
      },
   })

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
