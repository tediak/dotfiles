vim.pack.add({ 'https://github.com/A7Lavinraj/fyler.nvim' })

local fyler = require('fyler')

fyler.setup({
  default_explorer = true,
  delete_to_trash = true,
  icon_provider = 'nvim_web_devicons',
  icon = {
    directory_collapsed = '',
    directory_expanded = '',
    directory_empty = '󰉖',
  },
  git_status = {
    enabled = true,
  },
  mappings = {
    ['<esc>'] = 'CloseView',
    ['<cr>'] = 'Select',
    ['<c-t>'] = 'SelectTab',
    ['<c-v>'] = 'SelectVSplit',
    ['-'] = 'GotoParent',
    ['_'] = 'GotoCwd',
    ['.'] = 'GotoNode',
    ['#'] = 'CollapseAll',
    ['<bs>'] = 'CollapseNode',
  },
})

vim.keymap.set('n', '-', fyler.open, { desc = 'Open fyler buffer' })
