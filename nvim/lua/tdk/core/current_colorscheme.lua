vim.cmd.colorscheme('poimandres')

-- nvim-orgmode tweaks
vim.api.nvim_set_hl(0, '@org.headline.level1', {
  -- red
  fg = '#F7768E',
  bold = true,
})

vim.api.nvim_set_hl(0, '@org.headline.level2', {
  -- green
  fg = '#9ECE6A',
  bold = true,
})

vim.api.nvim_set_hl(0, '@org.headline.level3', {
  -- blue
  fg = '#7AA2F7',
  bold = true,
})

-- brighter verbatim (in orgmode)
vim.api.nvim_set_hl(0, '@org.verbatim', {
  fg = '#60d7d7',
  bold = true,
})

-- brighter inline code (in orgmode)
vim.api.nvim_set_hl(0, '@org.code', {
  fg = '#87afd7',
})

-- fix too bright vertical window separator
vim.api.nvim_set_hl(0, 'WinSeparator', {
  fg = '#121212',
})

-- fix bad rendering of code blocks in codecompanion chat
vim.api.nvim_set_hl(0, 'RenderMarkdownCode', {
  bg = 'NONE',
})

-- fix bad rendering of notifications in vim-dadbod-ui
vim.api.nvim_set_hl(0, 'NotificationInfo', {
  fg = '#e4f0fb',
  bg = 'NONE',
})

-- transparent background for folded items
vim.api.nvim_set_hl(0, 'Folded', {
  bg = 'NONE',
})

-- mini.statusline custom components
vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', {
  fg = '#000000',
  bg = '#87d7ff',
})

vim.api.nvim_set_hl(0, 'MiniStatuslineDevInfo', {
  fg = '#000000',
  bg = '#87d7ff',
})

-- transparent background for fzf-lua picker
vim.api.nvim_set_hl(0, 'PmenuSbar', {
  bg = 'NONE',
})
