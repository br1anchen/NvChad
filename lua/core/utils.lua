_G.nvchad = {}

nvchad.close_buffer = function(force)
   if vim.bo.buftype == "terminal" then
      vim.api.nvim_win_hide(0)
      return
   end

   local fileExists = vim.fn.filereadable(vim.fn.expand "%p")
   local modified = vim.api.nvim_buf_get_option(vim.fn.bufnr(), "modified")

   -- if file doesnt exist & its modified
   if fileExists == 0 and modified then
      print "no file name? add it now!"
      return
   end

   force = force or not vim.bo.buflisted or vim.bo.buftype == "nofile"

   -- if not force, change to prev buf and then close current
   local close_cmd = force and ":bd!" or ":bp | bd" .. vim.fn.bufnr()
   vim.cmd(close_cmd)
end

nvchad.load_config = function()
   local conf = require "core.default_config"

   -- attempt to load and merge a user config
   local chadrc_exists = vim.fn.filereadable(vim.fn.stdpath "config" .. "/lua/custom/chadrc.lua") == 1
   if chadrc_exists then
      -- merge user config if it exists and is a table; otherwise display an error
      local user_config = require "custom.chadrc"
      if type(user_config) == "table" then
         conf = vim.tbl_deep_extend("force", conf, user_config)
      else
         error "User config (chadrc.lua) *must* return a table!"
      end
   end

   return conf
end

nvchad.map = function(mode, keys, command, opt)
   local options = { silent = true }

   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   if type(keys) == "table" then
      for _, keymap in ipairs(keys) do
         nvchad.map(mode, keymap, command, opt)
      end
      return
   end

   vim.keymap.set(mode, keys, command, opt)
end

-- For those who disabled whichkey

nvchad.no_WhichKey_map = function()
   local mappings = nvchad.load_config().mappings

   for key, _ in pairs(mappings) do
      for mode, _ in pairs(mappings[key]) do
         for keybind, cmd in pairs(mappings[key][mode]) do
            -- disabled keys will not have cmd set
            if cmd ~= "" then
               nvchad.map(mode, keybind, cmd[1])
            end
         end
      end
   end

   require("plugins.configs.others").misc_mappings()
end

-- load plugin after entering vim ui
nvchad.packer_lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, timer)
   end
end

-- remove plugins defined in chadrc
nvchad.remove_default_plugins = function(plugins)
   local removals = nvchad.load_config().plugins.remove or {}

   if not vim.tbl_isempty(removals) then
      for _, plugin in pairs(removals) do
         plugins[plugin] = nil
      end
   end

   return plugins
end

-- merge default/user plugin tables
nvchad.plugin_list = function(default_plugins)
   local user_plugins = nvchad.load_config().plugins.user

   -- merge default + user plugin table
   default_plugins = vim.tbl_deep_extend("force", default_plugins, user_plugins)

   local final_table = {}

   for key, _ in pairs(default_plugins) do
      default_plugins[key][1] = key

      final_table[#final_table + 1] = default_plugins[key]
   end

   return final_table
end

nvchad.load_override = function(default_table, plugin_name)
   local user_table = nvchad.load_config().plugins.override[plugin_name]

   if type(user_table) == "table" then
      default_table = vim.tbl_deep_extend("force", default_table, user_table)
   else
      default_table = default_table
   end

   return default_table
end
