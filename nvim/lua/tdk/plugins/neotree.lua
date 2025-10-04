vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range('3.0.0 - 4.0.0') },
})

local neotree = require('neo-tree')

neotree.setup({})

vim.keymap.set(
  'n',
  '|',
  '<cmd>Neotree toggle reveal_force_cwd right<cr>',
  { desc = 'Reveal Neotree buffer' }
)
