local M = {}

function M.check_trigger_char(line_to_cursor, trigger_character)
   if trigger_character == nil then
      return false
   end
   for _, ch in ipairs(trigger_character) do
      local current_char = string.sub(line_to_cursor, #line_to_cursor - #ch + 1, #line_to_cursor)
      if current_char == ch then
         return true
      end
      if current_char == " " and #line_to_cursor > #ch + 1 then
         local pre_char = string.sub(line_to_cursor, #line_to_cursor - #ch, #line_to_cursor - 1)
         if pre_char == ch then
            return true
         end
      end
   end
   return false
end

function M.lspsaga_open_signature_help()
   local clients = vim.lsp.buf_get_clients(0)
   if clients == nil or clients == {} then
      return
   end

   local triggered = false
   for _, client in pairs(clients) do
      if client.server_capabilities.signatureHelpProvider then
         local triggers = client.server_capabilities.signatureHelpProvider.triggerCharacters

         local pos = vim.api.nvim_win_get_cursor(0)
         local line = vim.api.nvim_get_current_line()
         local line_to_cursor = line:sub(1, pos[2])

         if triggered == false then
            triggered = M.check_trigger_char(line_to_cursor, triggers)
         end
      end
   end

   if triggered then
      require("lspsaga.signaturehelp").signature_help()
   end
end

function M.setup()
   require("lspsaga").init_lsp_saga()

   local map = nvchad.map

   map("n", "<leader>lf", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
   map("n", "<leader>la", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
   map("n", "<leader>ld", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
   -- map("n","<M-k>","<CMD>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",opt)
   -- map("n","<M-j>","<CMD>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",opt)
   map("n", "<leader>ls", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
   map("n", "<leader>lr", "<cmd>lua require('lspsaga.rename').rename()<CR>")
   map("n", "<leader>lp", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>")
   -- buf_set_keymap("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
   -- buf_set_keymap("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

   vim.cmd "augroup Signature"
   vim.cmd "autocmd! * <buffer>"
   vim.cmd "autocmd InsertCharPre * lua require'custom.plugins.lspsaga'.lspsaga_open_signature_help()"
   vim.cmd "augroup end"
end

return M
