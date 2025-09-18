vim.pack.add({
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/antoinemadec/FixCursorHold.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-neotest/neotest-jest',
  'https://github.com/stevearc/overseer.nvim',
  'https://github.com/nvim-neotest/neotest',
})

local neotest = require('neotest')

neotest.setup({
  consumers = {
    overseer = require('neotest.consumers.overseer'),
  },
  adapters = {
    require('neotest-jest')({
      -- NOTE: to modify npm commands depending on the project
      jestCommand = function()
        local cwd = vim.fn.getcwd()

        if vim.endswith(cwd, 'custom/project') then return 'npm run custom-test-command --' end

        return 'npm test --'
      end,
      cwd = function() return vim.fn.getcwd() end,
    }),
  },
})

vim.keymap.set('n', '<leader>nS', function() neotest.summary.toggle() end, { desc = 'Toggle tests summary' })
vim.keymap.set('n', '<leader>nO', function() neotest.output_panel.toggle() end, { desc = 'Toggle output panel' })
vim.keymap.set('n', '<leader>nt', function() neotest.run.run() end, { desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>nT', function() neotest.run.run(vim.fn.expand('%')) end, { desc = 'Run current file' })
-- TODO: add dap keys
