local function get_mode_short()
  local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
  local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)
  local modes = setmetatable({
    ['n'] = { long = 'Normal', short = ' N ', hl = 'MiniStatuslineModeNormal' },
    ['v'] = { long = 'Visual', short = ' V ', hl = 'MiniStatuslineModeVisual' },
    ['V'] = { long = 'V-Line', short = 'V-L', hl = 'MiniStatuslineModeVisual' },
    [CTRL_V] = { long = 'V-Block', short = 'V-B', hl = 'MiniStatuslineModeVisual' },
    ['s'] = { long = 'Select', short = ' S ', hl = 'MiniStatuslineModeVisual' },
    ['S'] = { long = 'S-Line', short = 'S-L', hl = 'MiniStatuslineModeVisual' },
    [CTRL_S] = { long = 'S-Block', short = 'S-B', hl = 'MiniStatuslineModeVisual' },
    ['i'] = { long = 'Insert', short = ' I ', hl = 'MiniStatuslineModeInsert' },
    ['R'] = { long = 'Replace', short = ' R ', hl = 'MiniStatuslineModeReplace' },
    ['c'] = { long = 'Command', short = ' C ', hl = 'MiniStatuslineModeCommand' },
    ['r'] = { long = 'Prompt', short = ' P ', hl = 'MiniStatuslineModeOther' },
    ['!'] = { long = 'Shell', short = ' Sh', hl = 'MiniStatuslineModeOther' },
    ['t'] = { long = 'Terminal', short = ' T ', hl = 'MiniStatuslineModeOther' },
  }, {
    -- NOTE: By default return 'Unknown' but this shouldn't be needed
    __index = function() return { long = 'Unknown', short = 'U', hl = '%#MiniStatuslineModeOther#' } end,
  })
  local mode_info = modes[vim.fn.mode()]
  return mode_info.short, mode_info.hl
end

return {
  'echasnovski/mini.statusline',
  version = '*',
  opts = {
    content = {
      active = function()
        local MiniStatusline = require('mini.statusline')
        local mode, mode_hl = get_mode_short()
        local filename = '%f %m%r'
        local diff = MiniStatusline.section_diff({ trunc_width = 75, icon = '' })
        local git = MiniStatusline.section_git({ trunc_width = 100, icon = '' })
        local diagnostics = MiniStatusline.section_diagnostics({
          trunc_width = 75,
          signs = {
            ERROR = ' ',
            WARN = ' ',
            HINT = ' ',
            INFO = ' ',
          },
          icon = '',
        })
        local org_status = '%{v:lua.orgmode.statusline()}'
        local location = '%l:%v'

        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineDevinfo', strings = { filename } },
          { hl = 'MiniStatuslineFilename', strings = { diff, diagnostics, org_status } },
          '%=', -- End left alignment
          { hl = 'MiniStatuslineFileinfo', strings = { git } },
          { hl = mode_hl, strings = { location } },
        })
      end,
      inactive = nil,
    },
  },
}
