return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require('nvim-treesitter.configs')
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
  end,
}
