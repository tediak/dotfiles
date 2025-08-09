return {
  cmd = { 'markdown-oxide' },
  filetypes = { 'markdown' },
  root_markers = { '.git', '.obsidian', '.moxide.toml' },
  capabilities = require('blink.cmp').get_lsp_capabilities({
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  }),
}
