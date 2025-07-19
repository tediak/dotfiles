return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>ee",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Toggle Neo-tree"
    },
  },
  lazy = false,
  opts = {},
}
