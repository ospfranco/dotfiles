vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<D-s>", "<esc><cmd>w<cr>a", { desc = "Save file" })
vim.keymap.set("n", "<M-w>", "<cmd>bd!<cr>", { desc = "Close Buffer" })
-- vim.keymap.set("n", "<D-w>", ":bdelete<CR>", { noremap = true, silent = true })
