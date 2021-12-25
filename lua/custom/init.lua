--This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad
local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>bd", "<cmd>bd!<cr>", opts)
   map("n", "<leader>qq", "<cmd>wqa<cr>", opts)
   map("n", "<leader>ct", "<cmd>checktime<cr>", opts)

   map("n", "<leader>gl", "<cmd>LazyGit<cr>", opts)

   map("n", "<leader>ts", ":Telescope grep_string<CR>", opts)
   map("n", "<leader>tf", ":Telescope flutter commands<CR>", opts)

   map("n", "<leader>v<", "<C-w><", opts)
   map("n", "<leader>v>", "<C-w>>", opts)
   map("n", "<leader>v-", "<C-w>-", opts)
   map("n", "<leader>v+", "<C-w>+", opts)
   map("n", "<leader>v=", "<C-w>=", opts)
   map("n", "<leader>vs", "<cmd>split<cr>", opts)
   map("n", "<leader>vv", "<cmd>vsplit<cr>", opts)
   map("n", "<leader>vd", "<cmd>close<cr>", opts)

   map("i", "<C-F>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })

   -- trouble
   map("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
   map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opts)
   map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opts)
   map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
   map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
   -- vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

   -- nvim-dap
   map("n", "<leader>zb", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
   map("n", "<leader>zc", ":lua require'dap'.continue()<cr>", opts)
   map("n", "<leader>zo", ":lua require'dap'.step_over()<cr>", opts)
   map("n", "<leader>zi", ":lua require'dap'.step_into()<cr>", opts)
   map("n", "<leader>zr", ":lua require'dap'.repl.open()<cr>", opts)
   map("n", "<leader>zn", ":lua require('dapui').toggle('sidebar')<cr>", opts)
   map("n", "<leader>zk", ":lua require('dapui').eval()<cr>", opts)

   -- searchbox
   map("n", "<leader>s", '<cmd>lua require("searchbox").incsearch()<CR>', opts)
   map("v", "<leader>s", '<Esc><cmd>lua require("searchbox").incsearch({visual_mode = true})<CR>', opts)
   map("n", "<leader>sr", '<cmd>lua require("searchbox").replace({confirm = "menu"})<CR>', opts)
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   use { "kdheepak/lazygit.nvim" }

   use { "williamboman/nvim-lsp-installer" }

   use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   }
   use {
      "tami5/lspsaga.nvim",
      requires = {
         "neovim/nvim-lspconfig",
      },
      config = function()
         require("custom.plugins.lspsaga").setup()
      end,
   }

   use {
      "sudormrfbin/cheatsheet.nvim",
      requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
   }

   use {
      "github/copilot.vim",
      config = function()
         vim.cmd "let g:copilot_no_tab_map = v:true"
         vim.cmd "let g:copilot_assume_mapped = v:true"
      end,
   }

   use {
      "hrsh7th/cmp-copilot",
      after = "nvim-cmp",
   }

   use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require("custom.plugins.trouble").setup()
      end,
   }

   use { "tpope/vim-abolish" }

   use { "rrethy/vim-hexokinase", run = "make hexokinase" }

   use {
      "akinsho/flutter-tools.nvim",
      requires = "nvim-lua/plenary.nvim",
   }

   use {
      "simrat39/rust-tools.nvim",
      after = "nvim-lspconfig",
      requires = "nvim-lua/plenary.nvim",
   }

   use {
      "Pocco81/DAPInstall.nvim",
      config = function()
         require("custom.plugins.dap-install").setup()
      end,
   }

   use {
      "mfussenegger/nvim-dap",
      config = function()
         require("custom.plugins.nvim-dap").setup()
      end,
   }
   use {
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
         require("custom.plugins.nvim-dap-ui").setup()
      end,
   }

   use {
      "blackCauldron7/surround.nvim",
      config = function()
         require("surround").setup { mappings_style = "surround" }
      end,
   }

   use "MunifTanjim/nui.nvim"
   use {
      "VonHeikemen/searchbox.nvim",
      requires = {
         { "MunifTanjim/nui.nvim" },
      },
      config = function()
         require("searchbox").setup {}
      end,
   }

   use "ggandor/lightspeed.nvim"

   use {
      "karb94/neoscroll.nvim",
      opt = true,
      config = function()
         require("neoscroll").setup()
      end,

      -- lazy loading
      setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
      end,
   }

   use "ron-rs/ron.vim"
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
