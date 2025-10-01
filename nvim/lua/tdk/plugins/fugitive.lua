vim.pack.add({ 'https://github.com/tpope/vim-fugitive' })

vim.keymap.set('n', '<c-g>', '<cmd>vert Git<cr>', { desc = 'Open Git Status window in vertical split' })
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { desc = 'Open Git Blame window' })
vim.keymap.set('n', '<leader>gl', '<cmd>vert Git log --decorate<cr>', { desc = 'Open Git Log window' })

