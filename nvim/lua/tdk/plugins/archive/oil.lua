vim.pack.add({
  'https://github.com/stevearc/oil.nvim',
})

local oil = require('oil')

local detail

oil.setup({
  default_file_explorer = true,
  lsp_file_methods = {
    enabled = true,
  },
  delete_to_trash = true,
  win_options = {
    number = false,
    relativenumber = false,
    signcolumn = 'no', -- yes:2 for oil-git-status plugin, no by default
    cursorline = true,
  },
  keymaps = {
    ['gd'] = {
      desc = 'Toggle file detail view',
      callback = function()
        detail = not detail
        if detail then
          require('oil').set_columns({ 'icon', '', 'permissions', 'size', 'mtime' })
        else
          require('oil').set_columns({ 'icon' })
        end
      end,
    },
    ['q'] = false,
    ['gl'] = 'actions.refresh',
    ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
    ['<C-s>'] = false,
    ['<C-l>'] = false,
    ['<C-h>'] = false,
    ['<C-t>'] = false,
    ['<C-p>'] = false,
  },
  view_options = {
    show_hidden = true,
  },
  confirmation = {
    padding = 4,
    height = 0.1,
    width = 0.15,
    border = 'rounded',
    win_options = {
      winblend = 0
    }
  },
})

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open Oil buffer' })
