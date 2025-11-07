vim.pack.add({ 'https://github.com/nvim-mini/mini.indentscope' })

local indentscope = require('mini.indentscope')

indentscope.setup({ symbol = '│' })

vim.g.miniindentscope_disable = true

vim.keymap.set(
  'n',
  '<leader>tI',
  function() vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable end,
  { desc = 'Toggle indent scope' }
)
