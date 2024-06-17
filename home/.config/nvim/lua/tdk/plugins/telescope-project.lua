return {
  "nvim-telescope/telescope-project.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.load_extension("project")

    vim.keymap.set("n", "<leader>fp", function()
      telescope.extensions.project.project { display_type = "minimal" }
    end, { desc = "Open Projects tab" })
  end,
}
