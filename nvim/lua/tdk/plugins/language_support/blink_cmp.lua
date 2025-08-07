return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'kristijanhusak/vim-dadbod-completion',
  },
  opts = {
    enabled = function()
      local disabled_filetypes = {
        'DressingInput',
        'org-roam-select',
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
      ['<c-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<c-e>'] = { 'hide' },
      ['<c-j>'] = { 'select_next', 'fallback' },
      ['<c-k>'] = { 'select_prev', 'fallback' },
      ['<m-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<m-b>'] = { 'scroll_documentation_up', 'fallback' },
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
      ['<Tab>'] = {
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
        auto_show_delay_ms = 100,
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
      enabled = true,
    },
    sources = {
      default = { 'dadbod', 'snippets', 'lsp', 'path', 'buffer' },
      per_filetype = {
        org = { 'orgmode', 'path' },
      },
      providers = {
        dadbod = {
          name = 'dadbod',
          module = 'vim_dadbod_completion.blink',
          score_offset = 50,
        },
        orgmode = {
          name = 'Orgmode',
          module = 'orgmode.org.autocompletion.blink',
          fallbacks = { 'buffer' },
        },
        lsp = { score_offset = 10 },
        snippets = { score_offset = 50 },
      },
    },
  },
}
