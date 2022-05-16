-- MAPPINGS

local M = {}

M.general = {
   n = {
      ["<leader>bd"] = { "<cmd>bd!<cr>", "   close buffer" },
      ["<leader>qq"] = { "<cmd>%bdelete! | wqa<cr>", "   quit all" },
      ["<leader>ct"] = { "<cmd>checktime<cr>", "   refresh buffer" },
      ["nl"] = { ":noh<cr>", "   remove search highlight" },

      ["<leader>lcc"] = { "<cmd>LuaCacheClear<cr>", "   Clear Lua script cache" },

      ["<leader>ps"] = { "<cmd>PackerSync<cr>", "   Sync packer installs" },
   },
}

M.window = {
   n = {
      ["<leader>v<"] = { "<C-w><", " window resize left" },
      ["<leader>v>"] = { "<C-w>>", " window resize right" },
      ["<leader>v-"] = { "<C-w>-", "- window resize small" },
      ["<leader>v+"] = { "<C-w>+", "+ window resize large" },
      ["<leader>v="] = { "<C-w>=", "= window reset size" },
      ["<leader>vs"] = { "<cmd>split<cr>", "split window vertical" },
      ["<leader>vv"] = { "<cmd>vsplit<cr>", "split window horizontal" },
      ["<leader>vd"] = { "<cmd>close<cr>", "close window" },
   },
}

M.tab = {
   n = {
      ["<C-t>h"] = { "<cmd>tabfirst<cr>", "switch to first tab" },
      ["<C-t>k"] = { "<cmd>tabnext<cr>", "switch to next tab" },
      ["<C-t>j"] = { "<cmd>tabprev<cr>", "switch to previous tab" },
      ["<C-t>l"] = { "<cmd>tablast<cr>", "switch to last tab" },
   },
}

M.lspconfig = {
   n = {
      ["gr"] = {
         function()
            require("telescope.builtin").lsp_references()
         end,
         "   lsp references",
      },

      ["<leader>fm"] = {
         function()
            vim.lsp.buf.format {
               filter = function(clients)
                  -- filter out clients that you don't want to use
                  return vim.tbl_filter(function(client)
                     return client.name == "null-ls"
                  end, clients)
               end,
            }
         end,
         "   lsp formatting",
      },

      ["<leader>lf"] = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "   lsp saga find" },
      ["<leader>la"] = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "   lsp saga code action" },
      ["<leader>ld"] = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", "   lsp saga doc" },
      -- ["<M-k>"]={"<CMD>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
      -- ["<M-j>"]={"<CMD>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
      ["<leader>ls"] = {
         "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",
         "   lsp saga signature help",
      },
      ["<leader>lr"] = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "   lsp saga rename" },
      ["<leader>lp"] = {
         "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>",
         "   lsp saga preview dedefinition",
      },
      -- ["[d"]={"<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>"} ,
      -- ["]d"]={"<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>"} ,
   },
}

M.telescope = {
   n = {
      -- find
      ["<leader>ff"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "   find files" },
      ["<leader>fa"] = {
         "<cmd>lua require('telescope.builtin').find_files({follow=true, no_ignore=true, hidden=true})<cr>",
         "   find all",
      },
      ["<leader>ft"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "   live grep" },

      ["<leader>fw"] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "   find word" },
      ["<leader>fl"] = {
         "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>",
         "   find workspace symbols",
      },
      ["<leader>fb"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "   find buffers" },
      ["<leader>fh"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "   help page" },
      ["<leader>fo"] = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "   find oldfiles" },
      ["<leader>fk"] = { "<cmd>lua require('telescope.builtin').keymaps()<cr>", "    show keys" },
      ["<leader>fm"] = { "<cmd> Telescope media_files <CR>", "    find media" },

      -- git
      ["<leader>fc"] = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "   git commits" },
      ["<leader>fg"] = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "   git status" },

      -- pick a hidden term
      ["<leader>T"] = { "<cmd>lua require('telescope').extensions.terms.terms()<cr>", "    pick hidden term" },

      -- theme switcher
      ["<leader>fv"] = { "<cmd>lua require('telescope').extensions.themes.themes()<cr>", "   nvchad themes" },

      ["<leader>fj"] = { "<cmd>lua require('telescope'.extensions.emoji.emoji()<cr>", "   find emoji" },

      ["<leader>fat"] = { "<cmd>lua require 'telescope'.extensions.asynctasks.all(<cr>", "   find async task" },

      ["<leader>fws"] = {
         "<cmd>lua require 'telescope'.extensions.workspaces.workspaces()<cr>",
         "   find workspace",
      },

      ["<leader>fcp"] = { "<cmd>lua require 'telescope'.extensions.neoclip.neoclip()<cr>", "   find clipboard" },

      ["<leader>fq"] = {
         "<cmd>lua require 'telescope'.extensions.flutter.commands()<cr>",
         "   find flutter command",
      },

      ["<leader>fd"] = { ":Telescope dap commands<CR>", "   find debugger command" },
      ["<leader>fdc"] = { ":Telescope dap configurations<CR>", "   find debugger configuration" },
      ["<leader>fdb"] = { ":Telescope dap list_breakpoints<CR>", "   find debugger breakpoint" },
      ["<leader>fdv"] = { ":Telescope dap variables<CR>", "   find debugger variable" },
      ["<leader>fdf"] = { ":Telescope dap frames<CR>", "   find debugger frame" },

      ["<leader>fp"] = {
         "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>",
         "   file browser",
      },

      ["<leader>ftd"] = { ":TodoTelescope<CR>", "   file todo" },
   },
}

M.glow = {
   n = {
      ["<leader>p"] = { ":Glow<CR>", "   Glow preview markdown" },
   },
}

M.asynctasks = {
   n = {
      ["<leader>ate"] = { ":AsyncTaskEdit<CR>", "Edit async tasks" },
      ["<leader>atl"] = { ":AsyncTaskList<CR>", "Show async tasks" },
      ["<leader>atp"] = { ":AsyncTaskLast<CR>", "Run last runed async task" },
      ["<leader>atk"] = { ":AsyncStop<CR>", "Stop current async task" },
   },
}

-- local function termcodes(str)
--    return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
M.floatterm = {
   n = {
      ["<leader>gl"] = { "<cmd>FloatermNew! --name=lg lazygit<cr>", "   open lazygit in float term" },
      ["<leader>gq"] = { "<cmd>FloatermKill lg<cr>", "   close lazygit in float term" },
      ["<leader>gt"] = { "<cmd>FloatermToggle lg<cr>", "   toggle float term" },
   },
   -- t = {
   --    ["<leader>gq"] = { termcodes "<c-\\><c-N>:FloatermKill lg<cr>", "   close lazygit in float term" },
   --    ["<leader>gt"] = { termcodes "<c-\\><c-N>:FloatermToggle lg<cr>", "   toggle float term" },
   -- },
}

M.octo = {
   n = {
      ["<leader>od"] = { "<cmd>Octo review discard<cr>", "   Octo review discard" },
      ["<leader>om"] = { "<cmd>Octo pr merge rebase<cr>", "   Octo pr merge rebase" },
      ["<leader>oi"] = { "<cmd>Octo review start<cr>", "   Octo review start" },
      ["<leader>os"] = { "<cmd>Octo review submit<cr>", "   Octo review submit" },
      ["<leader>oa"] = { "<cmd>Octo review resume<cr>", "   Octo review resume" },
      ["<leader>ox"] = { "<cmd>Octo review close<cr>", "   Octo review close" },
      ["<leader>op"] = { "<cmd>Octo pr list<cr>", "   Octo pr list" },
   },
}

M.diffview = {
   n = {
      ["<leader>do"] = { "<cmd>DiffviewOpen origin/main...HEAD<cr>", "   Diffview current with origin/main" },
      ["<leader>ds"] = { "<cmd>DiffviewOpen origin/master...HEAD<cr>", "   Diffview current with origin/master" },
   },
}

M.dap = {
   n = {
      ["<leader>zb"] = { ":lua require'dap'.toggle_breakpoint()<cr>", "   debugger toggle breakpoint" },
      ["<leader>zc"] = { ":lua require'dap'.continue()<cr>", "   debugger continue" },
      ["<leader>zo"] = { ":lua require'dap'.step_over()<cr>", "   debugger step over" },
      ["<leader>zi"] = { ":lua require'dap'.step_into()<cr>", "   debugger step into" },
      ["<leader>zr"] = { ":lua require'dap'.repl.open()<cr>", "   debugger repl open" },
      ["<leader>zn"] = { ":lua require('dapui').toggle('sidebar')<cr>", "   debugger toggle sidebar" },
      ["<leader>zk"] = { ":lua require('dapui').eval()<cr>", "   debugger eval" },
      ["<leader>zl"] = { ":10sp | buffer \\[dap-repl]<cr>", "   focus debugger repl buffer" },
   },
}

M.trouble = {
   n = {
      ["<leader>xx"] = { "<cmd>Trouble<cr>", "   Open Trouble window" },
      ["<leader>xw"] = { "<cmd>Trouble workspace_diagnostics<cr>", "   Open Trouble workspace diagnostics" },
      ["<leader>xd"] = { "<cmd>Trouble document_diagnostics<cr>", "   Open Trouble document diagnostics" },
      ["<leader>xl"] = { "<cmd>Trouble loclist<cr>", "   Open Trouble loclist" },
      ["<leader>xq"] = { "<cmd>Trouble quickfix<cr>", "   Open Trouble quickfix" },
      ["<leader>xt"] = { ":TodoTrouble<CR>", "   Open todos in trouble" },
   },
}

M.searchbox = {
   n = {
      ["<leader>s"] = { '<cmd>lua require("searchbox").incsearch()<CR>', "   search in file" },
      ["<leader>sr"] = {
         '<cmd>lua require("searchbox").replace({confirm = "menu"})<CR>',
         "   search and replace in file",
      },
   },
   v = {
      ["<leader>s"] = {
         '<Esc><cmd>lua require("searchbox").incsearch({visual_mode = true})<CR>',
         "   search in file",
      },
   },
}

M.nvterm = {
   n = {
      ["<leader>tw"] = { '<cmd>lua require("nvterm.terminal").toggle "float"<cr>', "    toggle float nvterm" },
      ["<leader>tW"] = { '<cmd>lua require("nvterm.terminal").new "float"<cr>', "    spawn float nvterm" },
      ["<leader>th"] = {
         '<cmd>lua require("nvterm.terminal").toggle "horizontal"<cr>',
         "    toggle horizontal nvterm",
      },
      ["<leader>tH"] = {
         '<cmd>lua require("nvterm.terminal").new "horizontal"<cr>',
         "    spawn horizontal nvterm",
      },
      ["<leader>tv"] = {
         '<cmd>lua require("nvterm.terminal").toggle "vertical"<cr>',
         "    toggle vertical nvterm",
      },
      ["<leader>tV"] = { '<cmd>lua require("nvterm.terminal").new "vertical"<cr>', "    spawm vertical nvterm" },
   },
}

return M
