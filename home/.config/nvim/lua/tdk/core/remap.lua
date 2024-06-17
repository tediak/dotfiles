vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-c>", "<Esc>", { desc = "Idk" })

keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "Exit buffer (explore)" })
keymap.set("n", "<leader>wex", ':w<Bar>Ex<CR>',
  { noremap = true, silent = true, desc = "Save and exit buffer (explore)" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center the screen after moving a half page down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center the screen after moving a half page up" })
keymap.set("n", "gg", "ggzz", { desc = "Center a screen after moving to the top of the screen" })
keymap.set("n", "G", "Gzz", { desc = "Center a screen after moving to the bottom of the screen" })

keymap.set("n", "<C-w><left>", "<C-w><");
keymap.set("n", "<C-w><right>", "<C-w>>");
keymap.set("n", "<C-w><up>", "<C-w>+");
keymap.set("n", "<C-w><down>", "<C-w>-");

keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, { desc = "Go to next diagnostic point" })
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, { desc = "Go to next diagnostic point" })

vim.api.nvim_set_keymap("i", "<C-/>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- switch through tabs

keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next Tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous Tab" })

-- exit from terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode in terminal" })
