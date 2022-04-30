local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟",
            server_pending = "",
            server_uninstalled = "✗",
         },
      },
   }

   local custom_on_attach = function(client, bufnr)
      require("aerial").on_attach(client, bufnr)
      attach(client, bufnr)
   end

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = custom_on_attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      if server.name == "sumneko_lua" then
         opts.settings = {
            Lua = {
               diagnostics = {
                  -- Get the language server to recognize the `vim` global
                  globals = { "vim" },
               },
            },
         }
      end

      if server.name == "rust_analyzer" then
         local rustopts = {
            tools = {
               autoSetHints = true,
               hover_with_actions = true,
               executor = require("rust-tools/executors").termopen,
               runnables = {
                  use_telescope = true,
               },
               inlay_hints = {
                  show_parameter_hints = true,
                  parameter_hints_prefix = "<- ",
                  other_hints_prefix = "=> ",
                  max_len_align = false,
                  max_len_align_padding = 1,
                  right_align = false,
                  right_align_padding = 7,
               },
               hover_actions = {
                  border = "single",
                  auto_focus = false,
               },
            },
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
               settings = {
                  ["rust-analyzer"] = {
                     checkOnSave = {
                        command = "clippy",
                     },
                     inlayHints = {
                        closureReturnTypeHints = true,
                        lifetimeElisionHints = {
                           useParameterNames = true,
                        },
                        reborrowHints = true,
                     },
                  },
               },
            }),
         }
         require("custom.plugins.rust-tools").setup(rustopts)
         server:attach_buffers()
         return
      end

      if server.name == "stylelint_lsp" then
         opts.filetypes = { "scss", "less", "css", "sass" }
      end

      if server.name == "dartls" then
         require("custom.plugins.flutter-tools").setup(custom_on_attach, opts.capabilities)
      end

      if server.name == "sqls" then
         opts.on_attach = function(client, bufnr)
            require("sqls").on_attach(client, bufnr)
            custom_on_attach(client, bufnr)
         end
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)

   require("lspconfig").rnix.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
   }
end

return M
