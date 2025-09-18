vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "[r",
  "<cmd>lua require('kulala').jump_prev()<cr>zz",
  { noremap = true, silent = true, desc = "Jump to the previous request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "]r",
  "<cmd>lua require('kulala').jump_next()<cr>zz",
  { noremap = true, silent = true, desc = "Jump to the next request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>co",
  "<cmd>lua require('kulala').copy()<cr>",
  { noremap = true, silent = true, desc = "Copy the current request as a curl command" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>ci",
  "<cmd>lua require('kulala').from_curl()<cr>",
  { noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>cc",
  "<cmd>lua require('kulala').search()<cr>",
  { noremap = true, silent = true, desc = "Search between requests" }
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>ce",
  "<cmd>lua require('kulala').set_selected_env()<cr>",
  { noremap = true, silent = true, desc = "Select env" }
)
