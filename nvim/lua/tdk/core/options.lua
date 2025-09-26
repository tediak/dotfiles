local opt = vim.opt

-- Spell checker
opt.spell = false
opt.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
opt.spelllang = "en_us"
opt.spelloptions = "camel"

-- Enable exrc
opt.exrc = true

-- Background always in dark mode
opt.background = 'dark'

-- Folding settings
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevelstart = 99

-- Line Numbers (relative)
opt.number = true
opt.relativenumber = true

-- Tabs
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from the current line when starting a new line

-- Neovim tabs (show only file name in tabline)
opt.showtabline = 1
function TabLine()
  local s = ''
  local current = vim.api.nvim_get_current_tabpage()
  local tabs = vim.api.nvim_list_tabpages()

  for i, tab in ipairs(tabs) do
    local tabnr = vim.api.nvim_tabpage_get_number(tab)
    local hl = (tab == current) and '%#TabLineSel#' or '%#TabLine#'
    s = s .. '%' .. tabnr .. 'T' .. hl .. ' '

    local wins = vim.api.nvim_tabpage_list_wins(tab)

    -- Mark modified if any buffer in the tab is modified
    local modified = false
    for _, win in ipairs(wins) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_option(buf, 'modified') then
        modified = true
        break
      end
    end

    -- Use the current window's buffer name within the tab
    local cur_win_index = vim.fn.tabpagewinnr(tabnr)
    local cur_win = wins[cur_win_index] or wins[1]
    local cur_buf = vim.api.nvim_win_get_buf(cur_win)
    local name = vim.api.nvim_buf_get_name(cur_buf)
    local filename = vim.fn.fnamemodify(name, ':t')
    if filename == '' then filename = '[No Name]' end

    local label = ''
    if modified then label = label .. '*' end
    -- if label ~= '' then label = label .. ' ' end

    s = s .. filename .. label .. ' '

    -- End this tab's click target before the separator
    s = s .. '%T'

    -- Add a non-clickable separator between tabs
    if i < #tabs then
      s = s .. '%#TabLineFill#|%#TabLine#'
    end
  end

  -- Fill the rest of the tabline
  s = s .. '%#TabLineFill#'
  return s
end
vim.o.tabline = '%!v:lua.TabLine()'

-- Wrapping
opt.wrap = true -- line wrap

-- Searching
opt.ignorecase = true -- if searching with lowercase keyword, it will be case-insensitive
opt.smartcase = true -- if keyword has at least one uppercase char, search become case-sensitive

-- Highlight cursor line
opt.cursorline = false -- highlighted line on cursor position

-- Split windows defaults
opt.splitright = true
opt.splitbelow = true

-- Sign column
opt.signcolumn = 'yes:1'

-- Characters highlighting leaning whitespace characters
opt.list = true
opt.listchars:append({
  trail = '·',
  lead = ' ',
  tab = '  ',
})

-- Characters after EOF
-- opt.fillchars:append({ eob = " " })

-- Conceal Level
opt.conceallevel = 3

-- File Handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand('~/.vim/undodir') -- same for vim
opt.autoread = true
opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = false

-- Behavior
opt.backspace = 'indent,eol,start'
opt.autochdir = false
