vim.pack.add({ 'https://github.com/nvim-mini/mini.map' })

local map = require('mini.map')

map.setup({
  integrations = {
    map.gen_integration.builtin_search(),
    map.gen_integration.diff(),
    map.gen_integration.diagnostic(),
  },
})

vim.keymap.set('n', '<leader>tm', map.toggle, { desc = 'Toggle minimap' })
