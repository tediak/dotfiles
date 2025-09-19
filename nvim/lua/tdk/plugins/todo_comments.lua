vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/folke/todo-comments.nvim',
})

local todo_comments = require('todo-comments')

todo_comments.setup({
  keywords = {
    FIX = {
      icon = ' ',
      color = 'error',
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
    },
    TODO = {
      icon = ' ',
      color = 'info',
    },
    HACK = {
      icon = ' ',
      color = 'warning',
    },
    WARN = {
      icon = ' ',
      color = 'warning',
      alt = { 'WARNING' },
    },
    PERF = {
      icon = ' ',
      alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
    },
    NOTE = {
      icon = ' ',
      color = 'hint',
      alt = { 'INFO' },
    },
    TEST = {
      icon = '󰂓 ',
      color = 'test',
      alt = { 'TESTING', 'PASSED', 'FAILED' },
    },
  },
})

-- TODO: todo text

-- BUG: bug text

-- HACK: hack text

-- WARN: warn text

-- PERF: perf text

-- NOTE: note text

-- TEST: test text
