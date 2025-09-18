local group = vim.api.nvim_create_augroup('TDKPack', { clear = true })

local function rebuild_vscode_debug(data)
  local plugin_dir = data.path

  vim.notify('Clearing previous build artifacts...')
  vim.system({ 'rm', '-rf', 'out' }, { cwd = plugin_dir }):wait()

  vim.notify('Installing npm dependencies...')
  vim.system({ 'npm', 'install', '--legacy-peer-deps' }, { cwd = plugin_dir }):wait()

  vim.notify('Building dap server...')
  vim.system({ 'npx', 'gulp', 'dapDebugServer' }, { cwd = plugin_dir }):wait()

  vim.notify('Moving dist directory to out...')
  vim.system({ 'mv', 'dist', 'out' }, { cwd = plugin_dir }):wait()

  vim.notify('Built vscode-js-debug after ' .. data.kind, vim.log.levels.INFO)
end

vim.api.nvim_create_autocmd('PackChanged', {
  group = group,
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'vscode-js-debug' then
      rebuild_vscode_debug(event.data)
    end
  end,
})
