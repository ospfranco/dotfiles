vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("i", "<D-s>", "<esc><cmd>w<cr>a", { desc = "Save file" })