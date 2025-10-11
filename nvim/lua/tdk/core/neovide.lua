local alpha = function() return string.format('%x', math.floor(255 * (vim.g.transparency or 0.8))) end

if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono Nerd Font Mono:h11'

  vim.g.neovide_opacity = 0.8
  vim.g.transparency = 0.5
  vim.g.neovide_background_color = '#000000' .. alpha()
end
