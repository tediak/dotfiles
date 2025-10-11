vim.pack.add({
  'https://github.com/kristijanhusak/vim-dadbod-completion',
  'https://github.com/kirasok/cmp-hledger',
  { src = 'https://github.com/saghen/blink.compat', version = 'v2.5.0' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.7.0' },
})

local blink = require('blink.cmp')

blink.setup({
  fuzzy = {
    implementation = 'rust',
  },
  enabled = function()
    local disabled_filetypes = {
      'OverseerForm',
      'OverseerList',
    }

    local disabled_extensions = {
      'markdown',
    }

    local disabled_by_filetype = vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
    if disabled_by_filetype then return false end

    local disabled_by_extension = vim.tbl_contains(disabled_extensions, vim.fn.expand('%:e'))
    if disabled_by_extension then return false end

    return true
  end,
  keymap = {
    preset = 'none',
    ['<c-e>'] = false,
    ['<c-space>'] = { 'hide', 'show' },
    ['<c-j>'] = { 'select_next', 'fallback' },
    ['<c-k>'] = { 'select_prev', 'fallback' },
    ['<c-l>'] = { 'scroll_documentation_down', 'fallback' },
    ['<c-h>'] = { 'scroll_documentation_up', 'fallback' },
    ['<CR>'] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      'snippet_forward',
      'fallback',
    },
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    list = {
      selection = { preselect = true, auto_insert = false },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 150,
    },
    menu = {
      auto_show = true,
      draw = {
        columns = {
          { 'label', 'label_description', gap = 1 },
          { 'kind_icon', 'source_name', gap = 1 },
        },
      },
    },
  },
  cmdline = {
    enabled = false,
  },
  sources = {
    default = { 'dadbod', 'snippets', 'lsp', 'path', 'buffer' },
    per_filetype = {
      org = { 'orgmode', 'snippets', 'path' },
      ledger = { 'path', 'hledger' },
    },
    providers = {
      dadbod = {
        name = 'dadbod',
        module = 'vim_dadbod_completion.blink',
        score_offset = 20,
      },
      orgmode = {
        name = 'Orgmode',
        module = 'orgmode.org.autocompletion.blink',
        fallbacks = { 'buffer' },
      },
      hledger = {
        name = 'hledger',
        module = 'blink.compat.source',
        score_offset = 11,
      },
      lsp = { score_offset = 11 },
      snippets = { score_offset = 10 },
    },
  },
})
