vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
})

local neotree = require('neo-tree')

neotree.setup()

vim.keymap.set(
  'n',
  '<leader>ee',
  function() require('neo-tree.command').execute({ toggle = true }) end,
  { desc = 'Toggle Neotree' }
)
