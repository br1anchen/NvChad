-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>bd", "<cmd>bd!<cr>")
map("n", "<leader>bda", "<cmd>%bdelete!<cr>")
map("n", "<leader>qq", "<cmd>wqa<cr>")
map("n", "<leader>ct", "<cmd>checktime<cr>")
map("n", "nl", ":noh<cr>")

map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
map("n", "<leader>fl", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
map("n", "<leader>fj", "<cmd>lua require('telescope').extensions.emoji.emoji()<cr>")

map("n", "<leader>v<", "<C-w><")
map("n", "<leader>v>", "<C-w>>")
map("n", "<leader>v-", "<C-w>-")
map("n", "<leader>v+", "<C-w>+")
map("n", "<leader>v=", "<C-w>=")
map("n", "<leader>vs", "<cmd>split<cr>")
map("n", "<leader>vv", "<cmd>vsplit<cr>")
map("n", "<leader>vd", "<cmd>close<cr>")

map("n", "<C-t>h", "<cmd>tabfirst<cr>")
map("n", "<C-t>k", "<cmd>tabnext<cr>")
map("n", "<C-t>j", "<cmd>tabprev<cr>")
map("n", "<C-t>l", "<cmd>tablast<cr>")

map("n", "<leader>lcc", "<cmd>LuaCacheClear<cr>")

map("n", "<leader>ps", "<cmd>PackerSync<cr>")

-- map("i", "<C-F>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
