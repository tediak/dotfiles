vim.pack.add({
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/echasnovski/mini.statusline',
})

local statusline = require('mini.statusline')

-- overseer status for mini.statusline
local function overseer_status(opts)
  local ok = pcall(require, 'overseer')
  if not ok then return '' end

  opts = vim.tbl_extend('force', {
    label = '',
    colored = true,
    icons_enabled = true,
    unique = false,
    name = nil,
    name_not = false,
    status = nil,
    status_not = false,
    symbols = nil,
  }, opts or {})

  local constants = require('overseer.constants')
  local STATUS = constants.STATUS
  local task_list = require('overseer.task_list')
  local util = require('overseer.util')
  local default_icons = {
    [STATUS.FAILURE] = '󰅚 ',
    [STATUS.CANCELED] = ' ',
    [STATUS.SUCCESS] = '󰄴 ',
    [STATUS.RUNNING] = '󰑮 ',
  }
  local default_no_icons = {
    [STATUS.FAILURE] = 'F:',
    [STATUS.CANCELED] = 'C:',
    [STATUS.SUCCESS] = 'S:',
    [STATUS.RUNNING] = 'R:',
  }
  local symbols =
    vim.tbl_extend('keep', opts.symbols or {}, (opts.icons_enabled ~= false) and default_icons or default_no_icons)

  local tasks = task_list.list_tasks(opts)
  local by_status = util.tbl_group_by(tasks, 'status')

  local groups = {}
  if opts.label ~= '' then table.insert(groups, opts.label) end
  for _, status in ipairs(STATUS.values) do
    local lst = by_status[status]
    if symbols[status] and lst then
      local s = string.format('%s%d ', symbols[status], #lst)
      if opts.colored then
        table.insert(groups, { hl = 'Overseer' .. status, strings = { s } })
      else
        table.insert(groups, s)
      end
    end
  end

  return statusline.combine_groups(groups)
end

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

statusline.setup({
  content = {
    active = function()
      local mode, mode_hl = get_mode_short()
      local filename = '%f%m%r'
      local diff = vim.b.minidiff_summary_string
      local branch_name = ''
      if vim.fn.exists('*FugitiveStatusline') == 1 then
        local branch = vim.fn.FugitiveStatusline()
        branch_name = branch:match('%[Git%(([^)]+)%)%]') or ''
      end
      local diagnostics = statusline.section_diagnostics({
        trunc_width = 75,
        signs = {
          ERROR = ' ',
          WARN = ' ',
          HINT = ' ',
          INFO = ' ',
        },
        icon = '|',
      })

      local overseer_status_line = overseer_status({ colored = false })
      local location = '%4(%l:%v%)'

      return statusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineDevinfo', strings = { filename } },
        { hl = 'MiniStatuslineFilename', strings = { branch_name, diff, diagnostics } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { overseer_status_line } }, -- overseer status line
        { hl = 'MiniStatuslineFileinfo', strings = { location } },
      })
    end,
    inactive = nil,
  },
})
