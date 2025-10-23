return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      hint = {
        enable = true,
        setType = true,
        paramType = true,
        paramName = 'All', -- "All" | "Literal" | "Disable"
        arrayIndex = 'Auto', -- "Auto" | "Enable" | "Disable"
        await = true, -- optional, if you use async/await annotations
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      signatureHelp = { enabled = true },
    },
  },
}
