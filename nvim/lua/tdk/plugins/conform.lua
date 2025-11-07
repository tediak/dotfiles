vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    sql = { 'sqlfluff' },
    javascript = { 'eslint', 'prettier' },
    typescript = { 'eslint', 'prettier' },
    astro = { 'eslint', 'prettier' },
    http = { 'kulala' },
    rest = { 'kulala' },
    json = { 'jq' },
    ledger = { 'hledger' },
    journal = { 'hledger' },
    j = { 'hledger' },
  },
  formatters = {
    sqlfluff = {
      command = 'sqlfluff',
      args = {
        'format',
        '--dialect',
        'postgres',
        '-',
      },
      stdin = true,
      cwd = function() return vim.fn.getcwd() end,
    },
    kulala = {
      command = 'kulala-fmt',
      args = { 'format', '$FILENAME' },
      stdin = false,
    },
    hledger = {
      command = 'hledger-fmt',
      args = { '--fix', '--no-diff', '--exit-zero-on-changes' },
      stdin = false,
    },
  },
})

local function fmt()
  conform.format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 3000,
  })
end

vim.keymap.set('n', '<leader>fm', fmt, { desc = 'Format a file with conform' })
vim.keymap.set('n', '<f4>', fmt, { desc = 'Format a file with conform' })
