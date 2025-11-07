vim.pack.add({ 'https://github.com/stevearc/overseer.nvim' })

local overseer = require('overseer')

overseer.setup({
  task_list = {
    default_detail = 1,
    separator = '',
    direction = 'right',
    bindings = {
      ['<C-s>'] = false,
      ['<C-l>'] = false,
      ['<C-h>'] = false,
      ['L'] = 'IncreaseDetail',
      ['H'] = 'DecreaseDetail',
      ['<C-k>'] = false,
      ['<C-j>'] = false,
      ['J'] = 'ScrollOutputDown',
      ['K'] = 'ScrollOutputUp',
    },
  },
  component_aliases = {
    default = {
      { 'display_duration', detail_level = 2 },
      'on_exit_set_status',
      'on_complete_notify',
      { 'on_complete_dispose', require_view = { 'SUCCESS', 'FAILURE' } },
    },
  },
})

vim.keymap.set('n', '<c-s>', '<cmd>OverseerToggle<cr>', { desc = 'Toggle tasks view' })
vim.keymap.set('n', 'R', '<cmd>OverseerRun<cr>', { desc = 'Run task' })
vim.keymap.set('n', '<leader>R', '<cmd>OverseerLoadBundle<cr>', { desc = 'Load tasks bundle' })

vim.api.nvim_create_user_command('OverseerRestartLast', function()
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify('No tasks found', vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], 'restart')
  end
end, {})

vim.keymap.set('n', 'gR', '<cmd>OverseerRestartLast<cr>', { desc = 'Restart last task' })
