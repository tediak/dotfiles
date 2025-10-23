--- A function should load plugin in neovim only if it's not already loaded
function load_plugin_if_not_loaded_already(plugin_name)
  if not package.loaded[plugin_name] then
    return require(plugin_name)
  end
end
