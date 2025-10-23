vim.lsp.enable({
  -- Lua
  'luals',

  -- Typescript
  'ts_ls',
  'eslint',

  -- Astro
  'astro',

  -- Go
  'gopls',

  -- Kulala REST Client
  'kulala_ls',

  -- JSON
  'jsonls',

  -- CSS
  'cssls',

  -- Just
  'just',

  -- YAML
  'yamlls',
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = false,
})
