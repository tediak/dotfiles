return {
  'ibhagwan/fzf-lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    {
      '<leader><leader>',
      function()
        require('fzf-lua').files({
          cwd_only = true,
          previewer = false,
          cwd_prompt = false,
          cwd_header = true,
          formatter = 'path.filename_first',
        })
      end,
      desc = 'Go to file',
    },
    {
      '<leader>fb',
      function()
        require('fzf-lua').buffers({
          previewer = true,
        })
      end,
      desc = 'Go to buffer',
    },
    {
      '<leader>fs',
      function()
        require('fzf-lua').grep({
          previewer = true,
          glob_pattern = '*',
        })
      end,
      desc = 'Search in files',
    },
    {
      '<leader>fS',
      function()
        require('fzf-lua').live_grep_native({
          previewer = true,
          glob_pattern = '*',
        })
      end,
      desc = 'Search in files (live mode)',
    },
    {

      '<leader>fis',
      function()
        require('fzf-lua').lgrep_curbuf({
          previewer = true,
          glob_pattern = '*',
        })
      end,
      desc = 'Search in current buffer',
    },
    {
      '<leader>fcs',
      function()
        require('fzf-lua').colorschemes({
          previewer = false,
        })
      end,
      desc = 'Pick colorscheme',
    },
    {
      '<leader>fv',
      function()
        require('fzf-lua').treesitter({
          previewer = true,
        })
      end,
      desc = 'Search for treesitter vars',
    },
    {
      'gr',
      '<cmd>FzfLua lsp_references<cr>',
      desc = 'Show LSP references',
    },
    {
      'ggr',
      function()
        require('fzf-lua').lsp_references({
          jump1_action = require('fzf-lua').actions.file_vsplit,
        })
      end,
      desc = 'Show LSP references (vertical split)',
    },
    {
      'gd',
      '<cmd>FzfLua lsp_definitions<cr>',
      desc = 'Show LSP definitions',
    },
    {
      'ggd',
      function()
        require('fzf-lua').lsp_definitions({
          jump1_action = require('fzf-lua').actions.file_vsplit,
        })
      end,
      desc = 'Show LSP definitions (vertical split)',
    },
    {
      'gi',
      '<cmd>FzfLua lsp_implementations<cr>',
      desc = 'Show LSP implementations',
    },
    {
      'gt',
      '<cmd>FzfLua lsp_typedefs<cr>',
      desc = 'Show LSP type definitions',
    },
    {
      'ggt',
      function()
        require('fzf-lua').lsp_typedefs({
          jump1_action = require('fzf-lua').actions.file_vsplit,
        })
      end,
      desc = 'Show LSP type definitions (vertical split)',
    },
    {
      '<leader>D',
      '<cmd>FzfLua lsp_document_diagnostics<CR>',
      desc = 'Show buffer diagnostics',
    },
  },
  opts = {
    'borderless',
    defaults = {
      git_icons = false,
      file_icons = true,
    },
  },
}
