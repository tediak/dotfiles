-- Enable exrc
vim.o.exrc = true

-- Background always in dark mode
vim.o.background = "dark"

local opt = vim.opt

-- Folding settings
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99

-- Line Numbers (relative)
opt.number = true
opt.relativenumber = true

-- Tabs
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from the current line when starting a new line

-- Neovim tabs (show only file name in tabline)
opt.showtabline = 1
function _G.TabLine()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local filename = vim.fn.fnamemodify(bufname, ':t')
    local hl = (i == vim.fn.tabpagenr()) and '%#TabLineSel#' or '%#TabLine#'
    s = s .. hl .. ' ' .. (filename ~= '' and filename or '[No Name]') .. ' '
  end
  s = s .. '%#TabLineFill#'
  return s
end
vim.o.tabline = "%!v:lua.TabLine()"

-- Wrapping
opt.wrap = true -- line wrap

-- Searching
opt.ignorecase = true -- if searching with lowercase keyword, it will be case-insensitive
opt.smartcase = true  -- if keyword has at least one uppercase char, search become case-sensitive

-- Highlight cursor line
opt.cursorline = false -- highlighted line on cursor position

-- Split windows defaults
opt.splitright = true
opt.splitbelow = true

-- Sign column
opt.signcolumn = "yes"

-- Characters highlighting leaning whitespace characters
opt.list = true
opt.listchars:append({
  trail = "·",
  lead = " ",
  tab = "  ",
})

-- Conceal Level
opt.conceallevel = 3

-- File Handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.autoread = true
opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = false

-- Behavior
opt.backspace = "indent,eol,start"
opt.autochdir = false
