local map = require("core.utils").map
local M = {}

function M.setup(attach, capabilities)
   require("flutter-tools").setup {
      flutter_lookup_cmd = "asdf where flutter",
      widget_guides = {
         enabled = true,
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
         enabled = true,
         run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
         register_configurations = function()
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
         end,
      },
      dev_log = {
         enabled = true,
         open_cmd = "10sp", -- command to use to open the log buffer
      },
      lsp = {
         on_attach = attach,
         capabilities = capabilities,
         settings = {
            showTodos = false,
         },
      },
   }

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>ffc", ":Telescope flutter commands<CR>", opts)
end

return M
