local function abbrev(lhs, rhs) vim.keymap.set({ 'ia' }, lhs, rhs, { buffer = true }) end

local group = vim.api.nvim_create_augroup('TDKAbbrevs', { clear = true })

-- All
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { '*' },
  callback = function()
    abbrev('#H', 'ivan.yadzvinsky@gmail.com')
    abbrev('#W', 'i.yadzvinskij@artk.ai')
  end,
})

-- JS/TS/Others
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'javascript', 'typescript', 'astro' },
  callback = function()
    abbrev('cosnt', 'const')
    abbrev('lte', 'let')
    abbrev('cosnole', 'console')
    abbrev('retunr', 'return')
  end,
})

-- Go
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'go' },
  callback = function()
    abbrev('fucn', 'func')
    abbrev('improt', 'import')
    abbrev('packge', 'package')
    abbrev('retunr', 'return')
  end,
})
