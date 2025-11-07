vim.pack.add({ 'https://github.com/nvim-mini/mini.cursorword' })

local cursorword = require('mini.cursorword')

cursorword.setup({})

vim.g.minicursorword_disable = true

vim.keymap.set(
  'n',
  '<leader>tu',
  function() vim.g.minicursorword_disable = not vim.g.minicursorword_disable end,
  { desc = 'Toggle highlighting same words as under cursor' }
)
