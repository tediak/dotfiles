vim.filetype.add({
  filename = {
    ['todo.txt'] = 'todotxt',
    ['done.txt'] = 'todotxt',
  },
})

vim.pack.add({
  'https://github.com/phrmendes/todotxt.nvim',
})

local todo = require('todotxt')

todo.setup({
  todotxt = vim.env.HOME .. '/todo.txt',
  donetxt = vim.env.HOME .. '/done.txt',
  ghost_text = {
    enable = true,
    mappings = {
      ['(A)'] = 'now', -- High priority tasks
      ['(B)'] = 'next', -- Medium priority tasks
      ['(C)'] = 'today', -- Lower priority tasks
      ['(D)'] = 'tomorrow', -- Even lower priority
      ['(E)'] = 'this week',
      ['(F)'] = 'next week',
    },
  },
})

vim.keymap.set('n', '<leader>0', '<cmd>TodoTxt<cr>', { desc = 'Toggle todo.txt floating window' })
vim.keymap.set('n', '<leader>A', '<cmd>TodoTxt new<cr>', { desc = 'New todo.txt entry' })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { 'todo.txt', 'done.txt' },
  callback = function()
    vim.keymap.set('n', '<localleader>s', '<Plug>(TodoTxtSortTasks)', { desc = 'Sort tasks (default)', buffer = true })
    vim.keymap.set('n', '<localleader>p', '<Plug>(TodoTxtSortByPriority)', { desc = 'Sort by priority', buffer = true })
    vim.keymap.set('n', '<localleader>c', '<Plug>(TodoTxtSortByContext)', { desc = 'Sort by context', buffer = true })
    vim.keymap.set('n', '<localleader>P', '<Plug>(TodoTxtSortByProject)', { desc = 'Sort by project', buffer = true })
    vim.keymap.set('n', '<localleader>d', '<Plug>(TodoTxtSortByDueDate)', { desc = 'Sort by due date', buffer = true })
    vim.keymap.set(
      'n',
      '<localleader><localleader>',
      '<Plug>(TodoTxtToggleState)',
      { desc = 'Toggle task state', buffer = true }
    )
    vim.keymap.set('n', '-', '<Plug>(TodoTxtCyclePriority)', { desc = 'Cycle priority', buffer = true })
    vim.keymap.set('n', '<c-space>', '<Plug>(TodoTxtMoveDone)', { desc = 'Move done tasks', buffer = true })
  end,
})
