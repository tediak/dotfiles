return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      -- diagnostics = {
      --   globals = { 'vim' },
      -- },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false, -- Optional: Disable third-party library checks
      },
      signatureHelp = { enabled = true },
    },
  },
}
