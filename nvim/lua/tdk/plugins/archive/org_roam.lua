vim.pack.add({
  'https://github.com/nvim-orgmode/orgmode',
  'https://github.com/chipsenkbeil/org-roam.nvim',
})

local org_roam = require('org-roam')

org_roam.setup({
  directory = '~/my/roam',
  bindings = {
    find_node = '<Leader>of',
  },
})
