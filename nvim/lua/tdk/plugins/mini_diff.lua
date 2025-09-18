vim.pack.add({ 'https://github.com/echasnovski/mini.diff' })

local mini_diff = require('mini.diff')

mini_diff.setup({
  view = {
    style = 'number',
  },
})

vim.keymap.set('n', '<leader>to', mini_diff.toggle_overlay, { desc = 'Toggle diff overlay' })
