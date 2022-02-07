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

map("n", "<leader>p", ":Glow<CR>")

map("n", "<leader>fws", ":Telescope workspaces<CR>")

-- map("i", "<C-F>", 'copilot#Accept("<CR>")', { silent = true, script = true, expr = true })

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it
