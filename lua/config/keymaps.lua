local map = vim.keymap.set

--File Operations
map({ "n", "i" }, "<C-s>", "<cmd>write!<CR>", { desc = "Save file" })
map("v", "<C-c>", "y", { desc = "Copy marked field" })
map("i", "<C-v>", "p", { desc = "Paste from clipboard" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("n", "<C-z>", "u", { desc = "Undo" })
map("n", "<leader>q", "<cmd>qall<CR>", { desc = "Quit" })

--Move selection up/down
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

--Folder Tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Folder Tree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus Tree" })

--Nvzone
map({ "n", "i" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()
  vim.cmd.exec('"normal! \\<RightMouse>"')
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Nvzone-UI" })

--Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })

--LSP
map("n", "<C-f>", "<cmd>Lspsaga finder<CR>")
