# Neovim config

This config was intended for personal use only, but currently I'm trying to make it more transparent and easy to modify or extend. Currently there are three most common places you're wanna look in case to change some settings:

- [./lua/tdk/core/options.lua](./lua/tdk/core/options.lua) - Neovim options
- [./lua/tdk/core/remap.lua](./lua/tdk/core/remap.lua) - Global key mappings
- [./lua/tdk/colorschemes](./lua/tdk/colorschemes) - Colorschemes
- [./lua/tdk/core/lsp.lua](./lua/tdk/core/lsp.lua) and [./lsp](./lsp) - LSP settings
- [./lua/tdk/plugins](./lua/tdk/plugins) - Plugin specific settings and key mappings

## Plugins and features

- Language support
  - All lsp servers are using out-of-the-box configurations from [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
  - [blink.cmp](https://github.com/Saghen/blink.cmp) - autocompletion
  - [conform.nvim](https://github.com/stevearc/conform.nvim) - formatting
  - [nvim-dap](https://github.com/mfussenegger/nvim-dap) (with [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)) - debugging
  - [neotest](https://github.com/nvim-neotest/neotest) - testing
- Development tools
  - [vim-dadbod](https://github.com/tpope/vim-dadbod) (with [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)) - SQL databases management
  - [kulala.nvim](https://github.com/mistweaverco/kulala.nvim) - HTTP client
  - [vim-fugitive](https://github.com/tpope/vim-fugitive) - git client
  - [mini.diff](https://github.com/echasnovski/mini.diff) - git inline diff view
  - [overseer.nvim](https://github.com/stevearc/overseer.nvim) - task runner
  - [orgmode](https://github.com/nvim-orgmode/orgmode) with [org-roam](https://github.com/chipsenkbeil/org-roam.nvim) - org mode
- AI Development tools
  - [copilot.lua](https://github.com/zbirenbaum/copilot.lua) - inline suggestions
  - [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) - chat buffer
