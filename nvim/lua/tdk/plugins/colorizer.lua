vim.pack.add({ 'https://github.com/brenoprata10/nvim-highlight-colors' })

local hl_colors = require('nvim-highlight-colors')

hl_colors.setup({
  render = 'virtual',
  virtual_symbol_position = 'eol',
})

hl_colors.turnOff()

vim.keymap.set('n', '<leader>tc', '<cmd>HighlightColors Toggle<cr>', { desc = 'Toggle color highlights' })
