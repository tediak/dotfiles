return {
  'chipsenkbeil/org-roam.nvim',
  tag = '0.1.1',
  dependencies = { 'nvim-orgmode/orgmode' },
  opts = {
    directory = '~/my/roam',
    bindings = {
      find_node = '<Leader>of',
    },
  },
}
