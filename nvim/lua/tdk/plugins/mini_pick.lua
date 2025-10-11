vim.pack.add({
  'https://github.com/nvim-mini/mini.pick',
})

local pick = require('mini.pick')

pick.setup({
  mappings = {
    move_down = '<c-j>',
    move_up = '<c-k>',
  },
  options = {
    content_from_bottom = true,
    use_cache = true
  },
  window = {
    prompt_caret = '|',
    prompt_prefix = '> ',
  },
})

vim.keymap.set('n', '<leader><leader>', function() pick.builtin.files({}) end)
