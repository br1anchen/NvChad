local M = {}
local dap_install = require "dap-install"

function M.setup()
   dap_install.config("dart", {
      adapters = {
         type = "executable",
         command = "node",
         args = { vim.fn.stdpath "data" .. "/dapinstall/dart-code/out/dist/debug.js", "flutter" },
      },
      configurations = {
         {
            type = "dart",
            request = "launch",
            name = "Launch flutter",
            dartSdkPath = os.getenv "HOME" .. "/snap/flutter/common/flutter/bin/cache/dart-sdk/",
            flutterSdkPath = os.getenv "HOME" .. "/snap/flutter/common/flutter",
            program = "${workspaceFolder}/lib/main.dart",
            cwd = "${workspaceFolder}",
         },
      },
   })
end

return M
