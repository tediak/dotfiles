vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
})

local fzf = require('fzf-lua')

fzf.setup({
  defaults = {
    file_icons = false,
    git_icons = false,
    winopts = {
      height = 0.3,
      width = 1.0,
      row = 1.0,
      border = 'none',
      preview = {
        border = false
      }
    },
  },
  keymap = {
    fzf = {
      ['ctrl-d'] = 'half-page-down',
      ['ctrl-u'] = 'half-page-up',
    },
  },
})

-- Use fzf-lua picker as default one instead of vim.ui.select
fzf.register_ui_select()

vim.keymap.set('n', '<c-space>', '<cmd>FzfLua resume<cr>', { desc = 'Resume last picker' })

vim.keymap.set(
  'n',
  '<leader><leader>',
  function()
    fzf.files({
      prompt = '> ',
      cwd_only = true,
      previewer = false,
      cwd_prompt = false,
      cwd_header = true,
      formatter = 'path.filename_first',
    })
  end,
  { desc = 'Go to file' }
)

vim.keymap.set(
  'n',
  '<c-b>',
  function() fzf.buffers({ prompt = 'buffers> ', previewer = true }) end,
  { desc = 'Go to buffer' }
)

vim.keymap.set(
  'n',
  '<leader>fs',
  function()
    fzf.grep({
      previewer = true,
      glob_pattern = '*',
    })
  end,
  { desc = 'Search in files (grep for string)' }
)

vim.keymap.set(
  'n',
  '<leader>ff',
  function()
    fzf.live_grep_native({
      previewer = true,
      glob_pattern = '*',
      formatter = 'path.filename_first'
    })
  end,
  { desc = 'Search in files (live mode)' }
)

vim.keymap.set('n', 'grr', fzf.lsp_references, { desc = 'Show LSP references' })

vim.keymap.set(
  'n',
  'grR',
  function()
    fzf.lsp_references({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP references (vertical split)' }
)

vim.keymap.set('n', 'grd', fzf.lsp_definitions, { desc = 'Show LSP definitions' })

vim.keymap.set(
  'n',
  'grD',
  function()
    fzf.lsp_definitions({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP definitions (vertical split)' }
)

vim.keymap.set('n', 'gri', fzf.lsp_implementations, { desc = 'Show LSP implementations' })

vim.keymap.set(
  'n',
  'grI',
  function()
    fzf.lsp_implementations({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP definitions (vertical split)' }
)

vim.keymap.set('n', 'grt', fzf.lsp_typedefs, { desc = 'Show LSP type definitions' })

vim.keymap.set(
  'n',
  'grT',
  function()
    fzf.lsp_typedefs({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP type definitions (vertical split)' }
)

vim.keymap.set(
  'n',
  '<leader>gb',
  function()
    fzf.git_branches({
      cmd = 'git branch --color',
    })
  end,
  { desc = 'View git branches' }
)

vim.keymap.set('n', '<leader>gC', fzf.git_commits, { desc = 'View git commits (all)' })
vim.keymap.set('n', '<leader>gc', fzf.git_bcommits, { desc = 'View git commits (for current buffer)' })
