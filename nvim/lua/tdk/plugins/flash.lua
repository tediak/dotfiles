vim.pack.add({ 'https://github.com/folke/flash.nvim' })

local flash = require('flash')

flash.setup({
    jump = {
      autojump = false,
    },
  })

vim.keymap.set({ 'n', 'x', 'o' }, 's', flash.jump, { desc = 'Flash jump' })
vim.keymap.set({ 'c' }, '<esc>', flash.toggle, { desc = 'Toggle Flash Search' })
