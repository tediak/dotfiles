vim.pack.add({ 'https://github.com/mistricky/codesnap.nvim' })

local codesnap = require('codesnap')

codesnap.setup({
  title = 'code',
  code_font_family = 'Berkeley Mono',
  save_path = '~/Desktop',
  has_breadcrumbs = true,
  watermark = '',
  bg_padding = 0,
})
