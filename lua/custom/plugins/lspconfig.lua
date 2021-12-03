local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

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
         opts.settings = { ["rust-analyzer"] = { experimental = { procAttrMacros = true } } }
      end

      if server.name == "stylelint_lsp" then
         opts.filetypes = { "scss", "less", "css", "sass" }
      end

      --       if server.name == "efm" then
      --          local efm = require "custom.plugins.lsp.efm"
      --          opts.init_options = efm.init_options
      --          opts.filetypes = efm.filetypes
      --          opts.settings = efm.settings
      --       end
      --
      if server.name == "tsserver" then
         opts.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            attach(client, bufnr)
         end
      end

      if server.name == "dartls" then
         opts.on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            attach(client, bufnr)
         end
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
