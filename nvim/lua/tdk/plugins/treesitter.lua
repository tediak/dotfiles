vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

local opt = vim.opt
local configs = require('nvim-treesitter.configs')
-- local parsers = require('nvim-treesitter.parsers')
-- local parser_configs = parsers.get_parser_configs()

configs.setup({
  ensure_installed = {
    'c',
    'lua',
    'vim',
    'vimdoc',
    'html',
    'http',
    'json',
    'javascript',
    'typescript',
    'latex',
    'astro',
  },
  auto_install = false,
  modules = {},
  ignore_install = { 'org' },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  fold = { enable = true },
  playground = { ebable = true },
})
