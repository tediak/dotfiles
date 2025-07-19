return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { 'gS', '<cmd>TSJToggle<cr>', desc = 'Toggle split/join objects' },
  },
  config = function()
    require('treesj').setup({
      max_join_length = 500,
      use_default_keymaps = false,
    })
  end,
}
