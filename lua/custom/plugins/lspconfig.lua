local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   local disable_lsp_formatting_on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      attach(client, bufnr)
   end

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = function(client, bufnr)
            -- Run nvchad's attach
            attach(client, bufnr)

            -- if client.resolved_capabilities.document_formatting then
            --    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
            -- end
         end,
         capabilities = capabilities,
         flags = { debounce_text_changes = 150 },
         init_options = { documentFormatting = false },
         settings = {},
      }

      if server.name == "rust_analyzer" then
         local rustopts = {
            tools = {
               autoSetHints = true,
               hover_with_actions = false,
               inlay_hints = {
                  show_parameter_hints = true,
                  parameter_hints_prefix = "",
                  other_hints_prefix = "",
               },
            },
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
               on_attach = disable_lsp_formatting_on_attach,
               settings = {
                  ["rust-analyzer"] = {
                     completion = {
                        postfix = {
                           enable = false,
                        },
                     },
                     checkOnSave = {
                        command = "clippy",
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
         opts.on_attach = disable_lsp_formatting_on_attach
         opts.filetypes = { "scss", "less", "css", "sass" }
      end

      if server.name == "tsserver" then
         opts.on_attach = disable_lsp_formatting_on_attach
      end

      if server.name == "dartls" then
         opts.on_attach = disable_lsp_formatting_on_attach
         require("custom.plugins.flutter-tools").setup(disable_lsp_formatting_on_attach, opts.capabilities)
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)

   require("lspconfig").rnix.setup {
      on_attach = disable_lsp_formatting_on_attach,
      capabilities = capabilities,
   }
end

return M
