local keymap = vim.keymap

-- Utilities
keymap.set("n", "<leader>x", "<cmd>close<cr>", { desc = "Close current tab/pane" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Resize panes
keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Resize window (left)" })
keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Resize window (right)" })
keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Resize window (up)" })
keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Resize window (down)" })

-- Zoom current buffer
keymap.set("n", "<c-w>+", "<c-w>|<c-w>_", { desc = "Zoom current buffer" })

-- Center the screen after navigation
keymap.set("n", "<c-d>", "<c-d>zz", { desc = "Center the screen after moving half page down" })
keymap.set("n", "<c-u>", "<c-u>zz", { desc = "Center the screen after moving half page up" })
keymap.set("n", "n", "nzz", { desc = "Center a screen after moving to next word occurence" })
keymap.set("n", "N", "Nzz", { desc = "Center a screen after moving to next word occurence" })

-- Disable gg ang G (I'm using [[ and ]] as alternatives)
vim.keymap.set("n", "gg", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "G", "<Nop>", { noremap = true, silent = true })

-- Tabs management
keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close tab" })
keymap.set("n", "<leader>tX", "<cmd>tabonly<cr>", { desc = "Close all tabs except current" })
keymap.set("n", "]t", "<cmd>tabnext<cr>", { desc = "Next tab" })
keymap.set("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
keymap.set("n", "]T", "<cmd>tabmove +1<cr>", { desc = "Move tab to the right" })
keymap.set("n", "[T", "<cmd>tabmove -1<cr>", { desc = "Move tab to the left" })

-- LSP
local lspMapOpts = { silent = true }
lspMapOpts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, lspMapOpts)

lspMapOpts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, lspMapOpts)

lspMapOpts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", vim.diagnostic.goto_prev, lspMapOpts)

lspMapOpts.desc = "Go to next diagnostic"
keymap.set("n", "]d", vim.diagnostic.goto_next, lspMapOpts)

lspMapOpts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", vim.lsp.buf.hover, lspMapOpts)

lspMapOpts.desc = "Toggle inlay hints"
keymap.set("n", "<leader>gh", function() vim.g.inlay_hints_visible = not vim.g.inlay_hints_visible end, lspMapOpts)

-- More LSP key bindings are handled by fzf-lua plugin and located in its config
