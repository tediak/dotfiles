return {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git', 'package.json', 'tsconfig.json', 'jsconfig.json' },
  init_options = {
    provideFormatter = false,
  },
}
