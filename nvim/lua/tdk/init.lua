-- Core Neovim Settings
require('tdk.core.options')
require('tdk.core.remap')
require('tdk.core.lsp')
require('tdk.core.autocommands.pack')

-- Colorschemes
require('tdk.colorschemes.poimandres')
require('tdk.colorschemes.gruvbox')
require('tdk.core.colorscheme')

-- Notifications
require('tdk.plugins.fidget')

-- Files
require('tdk.plugins.oil')
require('tdk.plugins.neotree')


-- Language Support
require('tdk.plugins.treesitter')
require('tdk.plugins.blink_cmp')
require('tdk.plugins.conform')
require('tdk.plugins.dap')
require('tdk.plugins.neotest')

-- UI
-- require('tdk.plugins.alpha')
require('tdk.plugins.mini_statusline')

-- QoL
require('tdk.plugins.autopairs')
require('tdk.plugins.autotag')
require('tdk.plugins.flash')
-- require('tdk.plugins.hardtime')
require('tdk.plugins.repeat')
require('tdk.plugins.surround')
require('tdk.plugins.tmux_navigator')
require('tdk.plugins.todo_comments')
require('tdk.plugins.treesj')
require('tdk.plugins.unimpaired')


-- Task runner
require('tdk.plugins.overseer')

-- Fuzzy finder
require('tdk.plugins.fzf')

-- Artificial Intelligence (AI)
require('tdk.plugins.codecompanion')
require('tdk.plugins.copilot')

-- DB Management
require('tdk.plugins.dadbod')

-- REST Client
require('tdk.plugins.kulala')

-- Git
require('tdk.plugins.fugitive')
require('tdk.plugins.mini_diff')

-- Org Mode
require('tdk.plugins.orgmode')
require('tdk.plugins.org_roam')
