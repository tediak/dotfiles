vim.pack.add({
  'https://github.com/JezerM/oil-lsp-diagnostics.nvim',
  'https://github.com/stevearc/oil.nvim',
})

local oil = require('oil')
local oil_lsp = require('oil-lsp-diagnostics')

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
    signcolumn = 'no', -- yes:2 for oil-git-status plugin
  },
  keymaps = {
    ['gd'] = {
      desc = 'Toggle file detail view',
      callback = function()
        detail = not detail
        if detail then
          require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
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
  float = {
    max_height = 0.6,
    max_width = 0.4,
  },
})

oil_lsp.setup()

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open Oil buffer' })
