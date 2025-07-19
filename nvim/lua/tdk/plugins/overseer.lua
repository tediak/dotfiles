return {
  'stevearc/overseer.nvim',
  keys = {
    { '<leader>os', '<cmd>OverseerToggle<cr>', desc = 'Toggle tasks view' },
    { '<leader>r', '<cmd>OverseerRun<cr>', desc = 'Run a task' },
    { '<leader>R', '<cmd>OverseerBuild<cr>', desc = 'Create and run a new task' },
  },
  opts = {
    task_list = {
      direction = 'right',
      bindings = {
        ['<C-l>'] = false,
        ['<C-h>'] = false,
        ['['] = false,
        [']'] = false,
      },
    },
  },
}
