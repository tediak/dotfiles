return {
  'chipsenkbeil/org-roam.nvim',
  dependencies = { 'nvim-orgmode/orgmode' },
  opts = {
    directory = '~/my/roam',
    bindings = {
      find_node = '<Leader>of',
    },
  },
}
