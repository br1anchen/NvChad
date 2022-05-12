local map = nvchad.map
local M = {}

function M.setup()
   local lspconfig = require "plugins.configs.lspconfig"
   require("flutter-tools").setup {
      decorations = {
         statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
         },
      },
      flutter_lookup_cmd = "asdf where flutter",
      widget_guides = {
         enabled = true,
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
         enabled = true,
         run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
      },
      dev_log = {
         enabled = true,
         open_cmd = "10sp", -- command to use to open the log buffer
      },
      lsp = {
         on_attach = function(client, bufnr)
            require("aerial").on_attach(client, bufnr)
            lspconfig.on_attach(client, bufnr)
         end,
         capabilities = lspconfig.capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {
            showTodos = false,
         },
      },
   }

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>dc", "<cmd>lua require 'telescope'.extensions.flutter.commands()<cr>", opts)
end

return M
