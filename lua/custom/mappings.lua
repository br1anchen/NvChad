-- MAPPINGS
local map = nvchad.map

map("n", "<leader>bd", "<cmd>bd!<cr>")
map("n", "<leader>qq", "<cmd>%bdelete! | wqa<cr>")
map("n", "<leader>ct", "<cmd>checktime<cr>")
map("n", "nl", ":noh<cr>")

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
