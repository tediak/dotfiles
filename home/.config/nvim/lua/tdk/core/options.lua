local opt = vim.opt

-- remove netrw helper text on top
vim.g.netrw_banner = 0

opt.relativenumber = true
opt.number = true

opt.tabstop = 2        -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2     -- 2 spaces for indent width
opt.expandtab = true   -- expand tab to spaces
opt.autoindent = true  -- copy indent from the current line when starting a new line

opt.wrap = true        -- line wrap

opt.ignorecase = true  -- if searching with lowercase keyword, it will be case-insensitive
opt.smartcase = true   -- if keyword has at least one uppercase char, search become case-sensitive

opt.cursorline = false -- highlighted line on cursor position

-- GUI
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- set dots on trailing spaces
opt.list = true
opt.listchars:append({
  trail = "·",
  lead = " ",
  tab = "  ",
})

-- set conceal level to 1
opt.conceallevel = 1

-- set no folding by default
vim.opt.foldenable = false
