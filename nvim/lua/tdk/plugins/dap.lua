vim.pack.add({
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/leoluz/nvim-dap-go',
  'https://github.com/microsoft/vscode-js-debug',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/igorlfs/nvim-dap-view',
})

local dap = require('dap')
local dap_go = require('dap-go')
local ui = require('dap-view')
local wk = require('which-key')

wk.add({
  { '<leader>d', group = 'DAP' },
})

ui.setup()

dap_go.setup()

dap.adapters['pwa-node'] = {
  type = 'server',
  host = 'localhost',
  port = '${port}',
  executable = {
    command = 'node',
    args = {
      os.getenv('HOME') .. '/.local/share/nvim/site/pack/core/opt/vscode-js-debug/out/src/dapDebugServer.js',
      '${port}',
    },
  },
}

local node_config = {
  {
    type = 'pwa-node',
    request = 'attach',
    name = 'Attach to Server',
    port = function() return tonumber(vim.fn.input('Debug Port: ', '9229')) end,
    sourceMaps = true,
    cwd = '${workspaceFolder}',
  },
}

dap.configurations.typescript = node_config
dap.configurations.javascript = node_config

vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dd', dap.continue, { desc = 'Start / Continue debugging' })
vim.keymap.set('n', '<leader>du', '<cmd>DapViewToggle<cr>', { desc = 'Toggle DAP View' })
