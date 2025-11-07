vim.pack.add({
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/tpope/vim-rhubarb',
  'https://github.com/tommcdo/vim-fubitive'
})

local wk = require('which-key')

wk.add({
  { '<leader>g', group = 'Git' }
})

vim.keymap.set('n', '<c-g>', '<cmd>Git<cr>', { desc = 'Open Git Status window in vertical split' })
vim.keymap.set('n', 'gB', '<cmd>Git blame<cr>', { desc = 'Open Git Blame window' })
vim.keymap.set('n', '<leader>gl', '<cmd>vert Git log --decorate<cr>', { desc = 'Open Git Log window' })

