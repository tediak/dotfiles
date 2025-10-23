local map = vim.keymap.set
local unmap = function(mode, lhs) vim.keymap.set(mode, lhs, '<nop>') end

-- Set global leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Scrolling
map('n', '<down>', '5<c-e>', { desc = 'Scroll down' })
map('n', '<up>', '5<c-y>', { desc = 'Scroll up' })

-- Unset encryption
unmap({ 'n', 'x' }, 'g?')
unmap({ 'n' }, 'g+')
unmap({ 'n' }, 'g-')

-- Utilities
map('n', '<leader>x', '<cmd>close<cr>', { desc = 'Close current tab/pane' })
map('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Change command line window key
map('n', 'Q:', 'q:', { desc = 'Open command line window' })
unmap({ 'n', 'x' }, 'q:')

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
map('n', ']t', '<cmd>tabmove +1<cr>', { desc = 'Move tab to the right' })
map('n', '[t', '<cmd>tabmove -1<cr>', { desc = 'Move tab to the left' })

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

-- Show hl group under the cursor
local function show_hl_under_cursor()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local syn = nil
  local ok = pcall(function()
    local id = vim.fn.synID(row, col + 1, true)
    syn = vim.fn.synIDattr(vim.fn.synIDtrans(id), 'name')
  end)

  local captures = {}
  pcall(function()
    for _, cap in ipairs(vim.treesitter.get_captures_at_cursor(0)) do
      local name = cap.capture or cap.name or cap -- handles different return shapes
      table.insert(captures, tostring(name))
    end
  end)

  local ext_hls = {}
  local marks = vim.api.nvim_buf_get_extmarks(0, -1, {row - 1, col}, {row - 1, col + 1}, {details = true})
  for _, m in ipairs(marks) do
    local d = m[4]
    if d and (d.hl_group or d.hl_eol or d.virt_text) then
      if d.hl_group then table.insert(ext_hls, d.hl_group) end
      -- also collect hl groups from virt_text chunks
      if d.virt_text then
        for _, chunk in ipairs(d.virt_text) do
          local _, hl = chunk[1], chunk[2]
          if hl then table.insert(ext_hls, hl) end
        end
      end
    end
  end

  local parts = {}
  table.insert(parts, ('syn=%s'):format(syn or '∅'))
  table.insert(parts, ('ts=%s'):format(next(captures) and table.concat(captures, ', ') or '∅'))
  table.insert(parts, ('ext=%s'):format(next(ext_hls) and table.concat(ext_hls, ', ') or '∅'))
  vim.notify(table.concat(parts, '  '))
end

vim.api.nvim_create_user_command('HLUnderCursor', show_hl_under_cursor, {})

-- LSP
map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'See available code actions' })
map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Go to previous diagnostic' })
map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Go to next diagnostic' })
map('n', 'gd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Show documentation for what is under cursor' })
map('n', '<leader>ti', function()
  local was_enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not was_enabled)
  vim.notify('Inlay hints ' .. (was_enabled and 'disabled' or 'enabled'))
end, { desc = 'Toggle inlay hints' })

-- More LSP key bindings are handled by fzf-lua plugin and are located in respective config file
