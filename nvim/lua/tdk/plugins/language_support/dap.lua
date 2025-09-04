return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
    {
      'microsoft/vscode-js-debug',
      build = 'npm install --legacy-peer-deps && npx gulp dapDebugServer && mv dist out',
    },
  },
  keys = {
    {
      '<leader>b',
      function() require('dap').toggle_breakpoint() end,
      desc = 'Toggle breakpoint',
    },
    {
      '<leader>dd',
      function() require('dap').continue() end,
      desc = 'Start / Continue debugging',
    },
    {
      '<leader>du',
      function() require('dapui').toggle() end,
      desc = 'Toggle DAP UI',
    },
  },
  config = function()
    local dap = require('dap')
    local dap_go = require('dap-go')
    local ui = require('dapui')

    ui.setup()

    dap_go.setup()

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = {
          os.getenv('HOME') .. '/.local/share/nvim/lazy/vscode-js-debug/out/src/dapDebugServer.js',
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
  end,
}
