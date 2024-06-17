return {
  "voldikss/vim-floaterm",
  config = function()
    local keymap = vim.keymap

    keymap.set({ "n" }, "<C-m>", ":FloatermToggle<CR>", { desc = "Toggle floating terminal" })
  end
}
