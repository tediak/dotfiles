return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yml', 'yaml' },
  root_markers = { '.git' },
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
    yaml = {
      format = {
        enable = true,
      },
      schemas = {
        ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
        ['https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json'] = '/docker-compose*.{yml,yaml}',
      },
    },
  },
  on_init = function(client)
    --- https://github.com/neovim/nvim-lspconfig/pull/4016
    --- Since formatting is disabled by default if you check `client:supports_method('textDocument/formatting')`
    --- during `LspAttach` it will return `false`. This hack sets the capability to `true` to facilitate
    --- autocmd's which check this capability
    client.server_capabilities.documentFormattingProvider = true
  end,
}
