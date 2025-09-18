vim.pack.add({ 'https://github.com/tpope/vim-fugitive' })

vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Open Git Status window' })
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { desc = 'Open Git Blame window' })
vim.keymap.set('n', '<leader>gl', '<cmd>Git log<cr>', { desc = 'Open Git Log window' })
