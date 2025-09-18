vim.pack.add({ 'https://github.com/stevearc/overseer.nvim' })

local overseer = require('overseer')

overseer.setup()

vim.keymap.set('n', '<leader>os', '<cmd>OverseerToggle<cr>', { desc = 'Toggle tasks view' })
vim.keymap.set('n', 'R', '<cmd>OverseerRun<cr>', { desc = 'Run task' })
vim.keymap.set('n', '<leader>R', '<cmd>OverseerLoadBundle<cr>', { desc = 'Load tasks bundle' })
