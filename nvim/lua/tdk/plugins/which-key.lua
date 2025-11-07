vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

local wk = require('which-key')

wk.setup({
  delay = 500,
  keys = {
    scroll_down = '<c-e>', -- binding to scroll down inside the popup
    scroll_up = '<c-y>', -- binding to scroll up inside the popup
  },
  icons = {
    mappings = false,
  },
  spec = {
    { '<leader>f', group = 'Search (or format)' },
    { '<leader>c', group = 'Code actions' },
    { '<leader>t', group = 'Toggles' },
  },
})

vim.keymap.set('n', '<leader>?', function() wk.show({ global = true }) end, { desc = 'Show which-key buffer' })
