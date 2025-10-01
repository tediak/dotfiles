vim.pack.add({
  'https://github.com/ThePrimeagen/harpoon',
  'https://github.com/ibhagwan/fzf-lua',
})

local fzf = require('fzf-lua')
local harpoon = require('harpoon')

fzf.setup({
  defaults = {
    file_icons = false,
    git_icons = false,
    winopts = {
      height = 0.4, -- 40% of the screen height
      width = 1.0, -- full width
      row = 1.0, -- bottom of the screen
      col = 0.5, -- centered horizontally
      border = 'none', -- no border for true ivy look
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

vim.keymap.set(
  'n',
  '<c-space>',
  '<cmd>FzfLua resume<cr>',
  { desc = 'Resume last picker' }
)

vim.keymap.set(
  'n',
  '<leader><leader>',
  function()
    fzf.global({
      prompt = 'go> ',
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
  { desc = 'Search in files' }
)

vim.keymap.set(
  'n',
  '<leader>ff',
  function()
    fzf.live_grep_native({
      previewer = true,
      glob_pattern = '*',
    })
  end,
  { desc = 'Search in files (live mode)' }
)

vim.keymap.set(
  'n',
  '<leader>fis',
  function()
    fzf.lgrep_curbuf({
      previewer = true,
      glob_pattern = '*',
    })
  end,
  { desc = 'Search in current buffer' }
)

vim.keymap.set(
  'n',
  '<leader>fcs',
  function()
    fzf.colorschemes({
      previewer = false,
    })
  end,
  { desc = 'Pick colorscheme' }
)

vim.keymap.set(
  'n',
  '<leader>fv',
  function()
    fzf.treesitter({
      previewer = true,
    })
  end,
  { desc = 'Search for treesitter vars' }
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

vim.keymap.set('n', 'gd', fzf.lsp_definitions, { desc = 'Show LSP definitions' })

vim.keymap.set(
  'n',
  'gD',
  function()
    fzf.lsp_definitions({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP definitions (vertical split)' }
)

vim.keymap.set('n', 'gi', fzf.lsp_implementations, { desc = 'Show LSP implementations' })

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

vim.keymap.set('n', '<leader>D', fzf.lsp_document_diagnostics, { desc = 'Show buffer diagnostics' })

vim.keymap.set('n', '<leader>h', function()
  local harpoon_files = harpoon:list()

  local file_paths = {}
  for index, item in ipairs(harpoon_files.items) do
    -- Add the index to the file path
    table.insert(file_paths, string.format('[%d] %s', index, item.value))
  end

  fzf.fzf_exec(file_paths, {
    prompt = 'harpoon> ',
    previewer = false,
    winopts = {
      width = 0.3,
      height = 0.15,
      row = 0.5,
      col = 0.5,
    },
    actions = {
      ['default'] = function(selected)
        -- Extract the file path from the selected item
        local file_path = selected[1]:match('%] (.+)')
        vim.cmd('edit ' .. file_path)
      end,
    },
  })
end, { desc = 'Open Harpoon picker' })
