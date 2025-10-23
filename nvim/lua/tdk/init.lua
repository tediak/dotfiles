-- Core Neovim Settings
require('tdk.core.options')
require('tdk.core.remap')
require('tdk.core.lsp')
require('tdk.core.neovide')

-- Autocommands
require('tdk.core.autocommands.pack')
require('tdk.core.autocommands.colorscheme')
require('tdk.core.autocommands.abbrevs')

-- Colorschemes
require('tdk.colorschemes.tdk_colors')
require('tdk.colorschemes.gruvbox')
require('tdk.colorschemes.poimandres')
require('tdk.colorschemes.modus')
require('tdk.colorschemes.standard')
require('tdk.colorschemes.ashen')

vim.cmd.colorscheme('tdk-colors')

-- Built-in plugins
vim.cmd.packadd('nvim.undotree')

-- UI
require('tdk.plugins.mini_statusline')
require('tdk.plugins.icons')

-- Notifications
require('tdk.plugins.fidget')

-- Files
require('tdk.plugins.oil')
require('tdk.plugins.neotree')

-- Language Support
require('tdk.plugins.blink_cmp')
require('tdk.plugins.conform')
require('tdk.plugins.dap')
require('tdk.plugins.neotest')
require('tdk.plugins.treesitter')

-- QoL
require('tdk.plugins.autopairs')
require('tdk.plugins.repeat')
require('tdk.plugins.surround')
require('tdk.plugins.tmux_navigator')
require('tdk.plugins.todo_comments')
require('tdk.plugins.treesj')
require('tdk.plugins.unimpaired')
require('tdk.plugins.harpoon')
require('tdk.plugins.todotxt')

-- Task runner
require('tdk.plugins.overseer')

-- Picker
require('tdk.plugins.fzf')

-- Artificial Intelligence (AI)
require('tdk.plugins.copilot')
require('tdk.plugins.codecompanion')

-- DB Management
require('tdk.plugins.dadbod')

-- REST Client
require('tdk.plugins.kulala')

-- Git
require('tdk.plugins.fugitive')
require('tdk.plugins.mini_diff')
