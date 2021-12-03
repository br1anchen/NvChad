local M = {}
local dap = require "dap"

function M.setup()
   dap.adapters.dart = {
      type = "executable",
      command = "node",
      args = { os.getenv "HOME" .. "/Documents/Dart-Code/out/dist/debug.js", "flutter" },
   }
   dap.configurations.dart = {
      {
         type = "dart",
         request = "launch",
         name = "Launch flutter",
         dartSdkPath = os.getenv "HOME" .. "/snap/flutter/common/flutter/bin/cache/dart-sdk/",
         flutterSdkPath = os.getenv "HOME" .. "/snap/flutter/common/flutter",
         program = "${workspaceFolder}/lib/main.dart",
         cwd = "${workspaceFolder}",
      },
   }
end

return M
