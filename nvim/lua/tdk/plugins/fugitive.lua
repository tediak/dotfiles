return {
  'tpope/vim-fugitive',
  lazy = false,
  keys = {
    { '<leader>gs', '<cmd>Git<cr>', desc = 'Open interactive git status window' },
    { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Open git blame pane' },
    { '<leader>gl', '<cmd>Git log<cr>', desc = 'Open git log window' },
  },
}
