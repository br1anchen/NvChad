local M = {}

function M.setup()
   local dap_install = require "dap-install"
   local installation_path = vim.fn.stdpath "data" .. "/dapinstall/"

   dap_install.setup {
      installation_path = installation_path,
   }

   local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

   local overrides = {
      dart = {
         adapters = {
            type = "executable",
            command = "node",
            args = { installation_path .. "dart/Dart-Code/out/dist/debug.js", "flutter" },
         },
      },
   }

   for _, debugger in ipairs(dbg_list) do
      dap_install.config(debugger, overrides[debugger])
   end
end

return M
