local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local custom_on_attach = function(client, bufnr)
      require("aerial").on_attach(client, bufnr)
      attach(client, bufnr)
   end

   local flags = {
      debounce_text_changes = 150,
   }

   lspconfig.sumneko_lua.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
      settings = {
         Lua = {
            diagnostics = {
               -- Get the language server to recognize the `vim` global
               globals = { "vim", "require" },
            },
         },
      },
   }

   lspconfig.zk.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.dotls.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.html.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.stylelint_lsp.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
      filetypes = { "scss", "less", "css", "sass" },
   }

   lspconfig.sqls.setup {
      on_attach = function(client, bufnr)
         require("sqls").on_attach(client, bufnr)
         custom_on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.rnix.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.jsonls.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.lemminx.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.taplo.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }

   lspconfig.tsserver.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
   }
end

return M
