local map = vim.keymap.set

-- Set global leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Scrolling
map('n', '<down>', '5<c-e>', { desc = 'Scroll down' })
map('n', '<up>', '5<c-y>', { desc = 'Scroll up' })

-- Utilities
map('n', '<leader>x', '<cmd>close<cr>', { desc = 'Close current tab/pane' })
map('n', '<leader>nh', '<cmd>nohl<CR>', { desc = 'Clear search highlights' })

-- Change command line window key
map('n', 'Q:', 'q:', { desc = 'Open command line window' })
map('n', 'q:', '<nop>', { desc = 'Disable default Q mapping' })

-- Resize panes
map('n', '<C-w><left>', '<C-w><', { desc = 'Resize window (left)' })
map('n', '<C-w><right>', '<C-w>>', { desc = 'Resize window (right)' })
map('n', '<C-w><up>', '<C-w>+', { desc = 'Resize window (up)' })
map('n', '<C-w><down>', '<C-w>-', { desc = 'Resize window (down)' })

-- Zoom current buffer
map('n', '<c-w>+', '<c-w>|<c-w>_', { desc = 'Zoom current buffer' })

-- Center the screen after navigation
map('n', '<c-d>', '<c-d>zz', { desc = 'Center the screen after moving half page down' })
map('n', '<c-u>', '<c-u>zz', { desc = 'Center the screen after moving half page up' })
map('n', 'n', 'nzz', { desc = 'Center a screen after moving to next word occurence' })
map('n', 'N', 'Nzz', { desc = 'Center a screen after moving to next word occurence' })

-- Tabs management
map('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = 'New tab' })
map('n', '<leader>tx', '<cmd>tabclose<cr>', { desc = 'Close tab' })
map('n', '<leader>tX', '<cmd>tabonly<cr>', { desc = 'Close all tabs except current' })
map('n', ']t', '<cmd>tabnext<cr>', { desc = 'Next tab' })
map('n', '[t', '<cmd>tabprevious<cr>', { desc = 'Previous tab' })
map('n', ']T', '<cmd>tabmove +1<cr>', { desc = 'Move tab to the right' })
map('n', '[T', '<cmd>tabmove -1<cr>', { desc = 'Move tab to the left' })

-- Package Manager Update
vim.api.nvim_create_user_command('PackUpdate', function() vim.pack.update() end, { desc = 'Update all packages' })

-- Terminal
map('t', '<esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })

-- Node REPL
vim.api.nvim_create_user_command('Node', function()
  local height = math.floor(vim.o.lines * 0.3)
  vim.cmd(height .. 'split')
  vim.cmd('terminal node')
  vim.cmd('startinsert')
end, { desc = 'Open Node.js REPL' })

-- LSP
map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'See available code actions' })
map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Go to previous diagnostic' })
map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Go to next diagnostic' })
map('n', 'D', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Show documentation for what is under cursor' })
map('n', '<leader>ti', function()
  local was_enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not was_enabled)
  vim.notify('Inlay hints ' .. (was_enabled and 'disabled' or 'enabled'))
end, { desc = 'Toggle inlay hints' })

-- More LSP key bindings are handled by fzf-lua plugin and are located in respective config file
