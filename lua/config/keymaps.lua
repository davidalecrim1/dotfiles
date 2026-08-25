-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "<leader>j", "}", { desc = "Next paragraph" })
vim.keymap.set("n", "<leader>k", "{", { desc = "Previous paragraph" })

-- Split panes (match tmux: prefix+v / prefix+-)
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<cr><cmd>wincmd =<cr>", { desc = "Split right (horizontal)" })
vim.keymap.set("n", "<leader>-", "<cmd>split<cr><cmd>wincmd =<cr>", { desc = "Split below (vertical)" })
vim.keymap.del("n", "<leader>|")
