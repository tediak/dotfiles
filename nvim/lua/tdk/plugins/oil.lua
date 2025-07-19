return {
  'stevearc/oil.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open oil buffer" }
  },
  opts = {
    lsp_file_methods = {
      enabled = true,
    },
    keymaps = {
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
      ["q"] = { "actions.close", mode = "n" },
      ["gl"] = "actions.refresh",
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      ["<C-s>"] = false,
      ["<C-l>"] = false,
      ["<C-h>"] = false,
      ["<C-t>"] = false,
      ["<C-p>"] = false,
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == '.git'
      end,
    },
    float = {
      max_height = 0.6,
      max_width = 0.4,
    },
  },
  lazy = false,
}
