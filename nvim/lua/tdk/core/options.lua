local opt = vim.opt

-- Spell checker
opt.spell = false
opt.spellfile = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
opt.spelllang = 'en_us'
opt.spelloptions = 'camel'

-- Enable exrc
opt.exrc = true

-- Dark mode
opt.background = 'dark'

-- Folding settings
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevelstart = 99

-- Formatting settings
opt.formatexpr = "v:lua.require('conform').formatexpr()"

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from the current line when starting a new line

-- Neovim tabs
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

    local cur_win_index = vim.fn.tabpagewinnr(tabnr)
    local cur_win = wins[cur_win_index] or wins[1]
    local cur_buf = vim.api.nvim_win_get_buf(cur_win)
    local name = vim.api.nvim_buf_get_name(cur_buf)
    local filename = vim.fn.fnamemodify(name, ':t')
    if filename == '' then filename = '[No Name]' end

    s = s .. filename .. ' %T'

    if i < #tabs then s = s .. '%#TabLineFill#|%#TabLine#' end
  end

  s = s .. '%#TabLineFill#'
  return s
end
vim.o.tabline = '%!v:lua.TabLine()'

-- Wrapping
opt.wrap = true

-- Searching
opt.ignorecase = true -- if searching with lowercase keyword, it will be case-insensitive
opt.smartcase = true -- if keyword has at least one uppercase char, search become case-sensitive

-- Highlight cursor line
opt.cursorline = false

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
opt.fillchars:append({ eob = ' ' })

-- Conceal Level
opt.conceallevel = 3

-- File Handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undodir'
opt.autoread = true
opt.updatetime = 2000
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = false

-- Behavior
opt.backspace = 'indent,eol,start'
opt.autochdir = false
