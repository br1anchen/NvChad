vim.api.nvim_create_user_command("RunQtConsole", function()
   vim.fn.jobstart "jupyter qtconsole --JupyterWidget.include_other_output=True"
end, { nargs = 0 })

vim.api.nvim_create_user_command("PackerReinstall", function(opts)
   local name = opts.args

   if package.loaded["packer"] == nil then
      print "Packer not installed or not loaded"
   end

   local utils = require "packer.plugin_utils"
   local suffix = "/" .. name

   local opt, start = utils.list_installed_plugins()
   for _, group in pairs { opt, start } do
      if group ~= nil then
         for dir, _ in pairs(group) do
            if dir:sub(-string.len(suffix)) == suffix then
               vim.ui.input({ prompt = "Remove " .. dir .. "? [y/n] " }, function(confirmation)
                  if string.lower(confirmation) ~= "y" then
                     return
                  end
                  vim.cmd("!rm -rf " .. dir)
                  vim.cmd ":PackerSync"
               end)
               return
            end
         end
      end
   end
end, { nargs = 1 })
