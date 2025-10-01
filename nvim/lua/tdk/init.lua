-- Core Neovim Settings
require('tdk.core.autocommands.pack')
require('tdk.core.lsp')
require('tdk.core.options')
require('tdk.core.remap')

-- Colorschemes
require('tdk.colorschemes.gruvbox')
require('tdk.colorschemes.poimandres')
require('tdk.core.colorscheme')

-- UI
-- require('tdk.plugins.alpha')
require('tdk.plugins.mini_statusline')
require('tdk.plugins.icons')

-- Notifications
require('tdk.plugins.fidget')

-- Files
require('tdk.plugins.neotree')
require('tdk.plugins.oil')

-- Language Support
require('tdk.plugins.blink_cmp')
require('tdk.plugins.conform')
require('tdk.plugins.dap')
require('tdk.plugins.neotest')
require('tdk.plugins.treesitter')

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
require('tdk.plugins.harpoon')

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
-- require('tdk.plugins.orgmode')
-- require('tdk.plugins.org_roam')
