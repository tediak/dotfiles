return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
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
  },
}

-- TODO: todo text

-- BUG: bug text

-- HACK: hack text

-- WARN: warn text

-- PERF: perf text

-- NOTE: note text

-- TEST: test text
