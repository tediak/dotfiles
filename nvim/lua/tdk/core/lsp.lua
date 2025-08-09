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

  -- Markdown
  'markdown_oxide',
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
  virtual_text = true,
})

-- TODO: enable later, after I figure out what how to enable documentation in native autocompletion
-- vim.opt.completeopt:append('noselect')
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', {}),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
--     if client:supports_method('textDocument/completion') then
--       -- Optional: trigger autocompletion on EVERY keypress. May be slow!
--       -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--       -- client.server_capabilities.completionProvider.triggerCharacters = chars
--       vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
--     end
--   end,
-- })
