-- TODO: remove
vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})

require('tdk.lazy')
require('tdk.core')

vim.cmd('FzfLua register_ui_select')

