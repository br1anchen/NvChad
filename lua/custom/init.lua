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

   map("n", "<leader>fw", ":Telescope grep_string<CR>", opts)

   map("n", "<leader>v<", "<C-w><", opts)
   map("n", "<leader>v>", "<C-w>>", opts)
   map("n", "<leader>v-", "<C-w>-", opts)
   map("n", "<leader>v+", "<C-w>+", opts)
   map("n", "<leader>v=", "<C-w>=", opts)
   map("n", "<leader>vs", "<cmd>split<cr>", opts)
   map("n", "<leader>vv", "<cmd>vsplit<cr>", opts)
   map("n", "<leader>vd", "<cmd>close<cr>", opts)

   -- map("i", "<C-F>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
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
      "nvim-telescope/telescope-dap.nvim",
      after = "nvim-telescope/telescope.nvim",
      requires = "nvim-telescope/telescope.nvim",
      config = function()
         require("custom.plugins.telescope-dap").setup()
      end,
   }

   use {
      "nvim-telescope/telescope-file-browser.nvim",
      after = "nvim-telescope/telescope.nvim",
      requires = "nvim-telescope/telescope.nvim",
      config = function()
         require("custom.plugins.telescope-file-browser").setup()
      end,
   }

   -- use {
   --    "github/copilot.vim",
   --    config = function()
   --       vim.cmd "let g:copilot_no_tab_map = v:true"
   --       vim.cmd "let g:copilot_assume_mapped = v:true"
   --    end,
   -- }
   --
   -- use {
   --    "hrsh7th/cmp-copilot",
   --    after = "nvim-cmp",
   -- }

   use {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      after = "nvim-cmp",
      requires = "hrsh7th/nvim-cmp",
      config = function()
         require("custom.plugins.cmp-tabnine").setup()
      end,
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
         require("custom.plugins.searchbox").setup()
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

   use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
         require("custom.plugins.todo-comments").setup()
      end,
   }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
