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
vim.keymap.set('n', '<leader>)', '<cmd>DoneTxt<cr>', { desc = 'Toggle done.txt floating window' })
vim.keymap.set('n', '<leader>A', '<cmd>TodoTxt new<cr>', { desc = 'New todo.txt entry' })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { 'todo.txt', 'done.txt' },
  callback = function()
    vim.keymap.set('n', '<leader>s', '<Plug>(TodoTxtSortTasks)', { desc = 'Sort tasks (default)', buffer = true })
    vim.keymap.set('n', '<leader>p', '<Plug>(TodoTxtSortByPriority)', { desc = 'Sort by priority', buffer = true })
    vim.keymap.set('n', '<leader>c', '<Plug>(TodoTxtSortByContext)', { desc = 'Sort by context', buffer = true })
    vim.keymap.set('n', '<leader>P', '<Plug>(TodoTxtSortByProject)', { desc = 'Sort by project', buffer = true })
    vim.keymap.set('n', '<leader>d', '<Plug>(TodoTxtSortByDueDate)', { desc = 'Sort by due date', buffer = true })
    vim.keymap.set('n', '<cr>', '<Plug>(TodoTxtToggleState)', { desc = 'Toggle task state', buffer = true })
    vim.keymap.set('n', '<localleader>', '<Plug>(TodoTxtCyclePriority)', { desc = 'Cycle priority', buffer = true })
    vim.keymap.set('n', '<leader>D', '<Plug>(TodoTxtMoveDone)', { desc = 'Move done tasks', buffer = true })
  end,
})

function TDKTaskStatus()
  local file = vim.fn.expand('~/todo.txt')
  if vim.fn.filereadable(file) == 0 then return '' end

  local bufnr = vim.fn.bufnr(file, true)
  if not vim.api.nvim_buf_is_loaded(bufnr) then vim.fn.bufload(bufnr) end

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, 'todotxt')
  if not ok or not parser then return '' end

  local tree = parser:parse()[1]
  local root = tree:root()

  local query = vim.treesitter.query.parse(
    'todotxt',
    [[
    (task) @task
  ]]
  )

  local count = 0
  local highest_priority = nil
  local highest_task_title = nil

  local function priority_value(priority)
    if not priority then return 27 end
    local c = string.byte(priority)
    if c >= string.byte('A') and c <= string.byte('Z') then return c - string.byte('A') + 1 end
    return 27
  end

  for _, node in query:iter_captures(root, bufnr) do
    count = count + 1
    local text = vim.treesitter.get_node_text(node, bufnr)
    local prio, title = text:match('^%((%u)%)%s+(.*)')
    if not prio then title = text end
    if not highest_priority or priority_value(prio) < priority_value(highest_priority) then
      highest_priority = prio
      highest_task_title = title
    end
  end

  if count == 0 then
    return ''
  else
    local status = '󰱒 ' .. count
    if highest_task_title then status = status .. ' (' .. highest_task_title .. ')' end
    return status
  end
end
