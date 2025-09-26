local function hl(group, spec) vim.api.nvim_set_hl(0, group, spec) end

local overrides = {
  default = function()
    -- transparent background
    hl('Normal', { bg = 'NONE' })
    hl('WinSeparator', { fg = '#121212' })

    hl('Pmenu', { bg = '#000000' })
    hl('PmenuSbar', { bg = '#000000' })
    hl('PmenuThumb', { bg = '#000000' })
    hl('PmenuExtra', { bg = '#000000' })
    hl('PmenuKind', { bg = '#000000' })

    hl('StatusLineNC', { bg = '#000000', fg = 'NvimLightGrey3' })
  end,

  poimandres = function()
    -- nvim-orgmode tweaks
    hl('@org.headline.level1', { fg = '#F7768E', bold = true })
    hl('@org.headline.level2', { fg = '#9ECE6A', bold = true })
    hl('@org.headline.level3', { fg = '#7AA2F7', bold = true })

    -- brighter verbatim / inline code
    hl('@org.verbatim', { fg = '#60d7d7', bold = true })
    hl('@org.code', { fg = '#87afd7' })

    -- window separator + misc UI
    hl('WinSeparator', { fg = '#121212' })
    hl('RenderMarkdownCode', { bg = 'NONE' })
    hl('NotificationInfo', { fg = '#e4f0fb', bg = 'NONE' })
    hl('Folded', { bg = 'NONE' })

    -- mini.statusline custom components
    hl('MiniStatuslineModeInsert', { fg = '#000000', bg = '#87d7ff' })
    hl('MiniStatuslineDevInfo', { fg = '#000000', bg = '#87d7ff' })

    -- fzf-lua picker transparency
    hl('PmenuSbar', { bg = 'NONE' })
  end,

  oxocarbon = function()
    -- transparent backgrounds
    hl('Normal', { bg = 'NONE' })
    hl('NormalNC', { bg = 'NONE' })
  end,

  gruvbox = function()
    -- fzf-lua picker transparency
    hl('PmenuSbar', { bg = 'NONE' })
    hl('PmenuThumb', { bg = 'NONE' })
  end,
}

local function apply(name)
  local fn = overrides[name]
  if fn then pcall(fn) end
end

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('TDKColorschemeOverrides', { clear = true }),
  pattern = '*',
  callback = function() apply(vim.g.colors_name) end,
})

vim.cmd.colorscheme('default')
