local M = {}

local extension_path = vim.fn.stdpath "data" .. "/dapinstall/codelldb/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

function M.setup(opts)
   opts.dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
   }
   require("rust-tools").setup(opts)
end

return M
