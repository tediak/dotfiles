local function hl(group, spec) vim.api.nvim_set_hl(0, group, spec) end

local overrides = {
  dark = {
    default = function()
      hl('Normal', { bg = 'NONE' })
      hl('WinSeparator', { fg = '#121212' })
      hl('Pmenu', { bg = '#000000' })
      hl('PmenuSbar', { bg = '#000000' })
      hl('PmenuThumb', { bg = '#000000' })
      hl('PmenuExtra', { bg = '#000000' })
      hl('PmenuKind', { bg = '#000000' })
      hl('StatusLineNC', { bg = '#121212', fg = 'NvimLightGrey3' })
      hl('TabLineSel', { fg = 'NvimLightCyan' })

      hl('diffLine', { fg = 'NvimDarkCyan' })
      hl('diffFile', { fg = 'NvimDarkCyan' })
      hl('diffAdded', { fg = 'NvimLightGreen', bg = 'NvimDarkGreen' })
      hl('diffRemoved', { fg = 'NvimLightRed', bg = 'NvimDarkRed' })
      hl('diffChanged', { fg = 'NvimLightCyan', bg = 'NvimDarkCyan' })
      hl('diffSubname', { fg = 'NvimDarkCyan' })
      hl('diffIndexLine', { fg = 'NvimDarkCyan' })
      hl('diffIdentical', { fg = 'NvimDarkCyan' })

      hl('fugitiveUntrackedHeading', { fg = 'NvimLightGrey4' })
      hl('fugitiveUntrackedModifier', { fg = 'NvimLightGrey4' })
      hl('fugitiveUnstagedHeading', { fg = 'NvimDarkCyan' })
      hl('fugitiveUnstagedModifier', { fg = 'NvimDarkCyan' })
      hl('fugitiveStagedHeading', { fg = 'NvimLightCyan' })
      hl('fugitiveStagedModifier', { fg = 'NvimLightCyan' })

      hl('NeoTreeGitConflict', { italic = false, fg = 'NvimLightYellow' })
      hl('NeoTreeGitUnstaged', { italic = false, fg = 'NvimLightYellow' })
      hl('NeoTreeGitUntracked', { italic = false, fg = 'NvimLightYellow' })

      hl('NvimDapViewTabSelected', { fg = 'NvimLightCyan' })

      hl('FzfLuaDirPart', { fg = 'NvimDarkGrey4' })
    end,

    poimandres = function()
      hl('WinSeparator', { fg = '#121212' })
      hl('RenderMarkdownCode', { bg = 'NONE' })
      hl('NotificationInfo', { fg = '#e4f0fb', bg = 'NONE' })
      hl('MiniStatuslineModeInsert', { fg = '#000000', bg = '#87d7ff' })
      hl('MiniStatuslineDevInfo', { fg = '#000000', bg = '#87d7ff' })
      hl('PmenuSbar', { bg = 'NONE' })
    end,

    oxocarbon = function()
      hl('Normal', { bg = 'NONE' })
      hl('NormalNC', { bg = 'NONE' })
    end,

    gruvbox = function()
      hl('Normal', { bg = 'NONE' })
      hl('SignColumn', { link = 'Normal' })
      hl('WinSeparator', { fg = '#121212' })

      hl('PmenuSbar', { bg = 'NONE' })
      hl('PmenuThumb', { bg = 'NONE' })
    end,

    modus_vivendi = function()
      hl('LineNr', { link = 'SpecialKey' })
      hl('LineNrAbove', { link = 'LineNr' })
      hl('LineNrBelow', { link = 'LineNr' })
      hl('SignColumn', { link = 'LineNr' })
    end,

    standard = function()
      hl('Normal', { bg = 'NONE' })
      hl('NormalFloat', { bg = 'NONE' })
      hl('SignColumn', { link = 'Normal' })
      hl('Keyword', { fg = '#d53880' })
      hl('Comment', { fg = '#505a5f' })
      hl('Exception', { fg = '#d4351c' })
      hl('Delimiter', { fg = '#505a5f' })
      hl('@keyword.return', { fg = '#912b88' })
    end,

    ashen = function() hl('WinSeparator', { fg = '#121212' }) end,
  },

  light = {
    default = function() hl('WinSeparator', { fg = '#9E9E9E' }) end,

    gruvbox = function() hl('SignColumn', { link = 'Normal' }) end,

    modus_operandi = function()
      hl('LineNr', { link = 'SpecialKey' })
      hl('LineNrAbove', { link = 'LineNr' })
      hl('LineNrBelow', { link = 'LineNr' })
    end,

    standard = function()
      hl('SignColumn', { link = 'Normal' })
      hl('Keyword', { fg = '#d53880' })
      hl('Comment', { fg = '#505a5f' })
      hl('Exception', { fg = '#d4351c' })
    end,
  },
}

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('TDKColorScheme', { clear = true }),
  pattern = '*',
  callback = function(args)
    local name = args.match
    local background = vim.o.background
    local overrides_bg = overrides[background]
    local fn = overrides_bg[name]
    if fn then pcall(fn) end
  end,
})
