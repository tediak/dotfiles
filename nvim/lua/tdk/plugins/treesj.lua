vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/Wansmer/treesj',
})

local treesj = require('treesj')

treesj.setup({
  max_join_length = 500,
  use_default_keymaps = false,
})

vim.keymap.set('n', 'gS', '<cmd>TSJToggle<cr>', { desc = 'Toggle split/join objects' })
