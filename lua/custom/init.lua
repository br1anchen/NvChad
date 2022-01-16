-- This is an example init file , its supposed to be placed in /lua/custom/

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>bd", "<cmd>bd!<cr>")
map("n", "<leader>qq", "<cmd>wqa<cr>")
map("n", "<leader>ct", "<cmd>checktime<cr>")

map("n", "<leader>gl", "<cmd>LazyGit<cr>")

map("n", "<leader>fw", ":Telescope grep_string<CR>")

map("n", "<leader>v<", "<C-w><")
map("n", "<leader>v>", "<C-w>>")
map("n", "<leader>v-", "<C-w>-")
map("n", "<leader>v+", "<C-w>+")
map("n", "<leader>v=", "<C-w>=")
map("n", "<leader>vs", "<cmd>split<cr>")
map("n", "<leader>vv", "<cmd>vsplit<cr>")
map("n", "<leader>vd", "<cmd>close<cr>")

map("n", "<leader>ate", ":AsyncTaskEdit<CR>")
map("n", "<leader>atl", ":AsyncTaskList<CR>")

-- map("i", "<C-F>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })
-- NOTE: the 4th argument in the map function can be a table i.e options but its most likely un-needed so dont worry about it

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
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
      after = "telescope.nvim",
      requires = "nvim-telescope/telescope.nvim",
      config = function()
         require("custom.plugins.telescope-dap").setup()
      end,
   }

   use {
      "nvim-telescope/telescope-file-browser.nvim",
      after = "telescope.nvim",
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

   use "tpope/vim-surround"

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

   use {
      "skywind3000/asyncrun.vim",
      setup = function()
         vim.cmd "let g:asyncrun_open = 6"
      end,
   }
   use {
      "skywind3000/asynctasks.vim",
      requires = "skywind3000/asyncrun.vim",
      setup = function()
         vim.cmd "let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg', '.gitignore']"
      end,
   }

   use {
      "ntpeters/vim-better-whitespace",
      config = function()
         vim.cmd "let g:better_whitespace_enabled=1"
         vim.cmd "let g:strip_whitespace_on_save=1"
         vim.cmd "let g:strip_whitespace_confirm=0"
      end,
   }
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use) end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
