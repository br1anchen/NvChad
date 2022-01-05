local map = require("core.utils").map
local M = {}

function M.setup(attach, capabilities)
   require("flutter-tools").setup {
      widget_guides = {
         enabled = true,
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
         enabled = true,
         run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
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

   require("telescope").load_extension "flutter"

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>ffc", ":Telescope flutter commands<CR>", opts)
end

return M
