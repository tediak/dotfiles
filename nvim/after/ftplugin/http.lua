local function map(mode, key, fn, opts) vim.keymap.set(mode, key, fn, { buffer = true, unpack(opts or {}) }) end

local kulala = require('kulala')

map('n', '[r', kulala.jump_prev, { desc = 'Jump to the previous request' })
map('n', ']r', kulala.jump_next, { desc = 'Jump to the next request' })
map('n', '<leader>y', kulala.copy, { desc = 'Copy the current request as a curl command' })
map('n', '<leader>p', kulala.from_curl, { desc = 'Paste curl from clipboard as http request' })
map('n', '<leader>cc', kulala.search, { desc = 'Search between requests' })
map('n', '<leader>ce', kulala.set_selected_env, { desc = 'Select env' })
