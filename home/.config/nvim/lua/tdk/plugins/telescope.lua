return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
    local telescope_actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        layout_strategy = "flex",
        -- layout_config = {
        --   prompt_position = "bottom",
        --   -- preview_cutoff = 120,
        --   -- preview_width = 100,
        --   width = 0.7,
        --   height = 0.7,
        -- },
        border = true,
        path_display = {
          "tail"
        },
        sorting_strategy = "descending",
        mappings = {
          i = {
            ["<esc>"] = telescope_actions.close,
            ["<C-j>"] = telescope_actions.move_selection_next,
            ["<C-k>"] = telescope_actions.move_selection_previous,
          },
        },
      },
      extensions = {
        project = {
          hidden_files = false, -- default: false
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = false, -- default false
          -- default for on_project_selected = find project files
          -- on_project_selected = function(prompt_bufnr)
          --   project_actions.change_working_directory(prompt_bufnr, false)
          -- end
        },
        smart_open = {
          show_scores = true,
        }
      }
    })

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy Finder" })
    vim.keymap.set("n", "<leader><leader>", function()
      require("telescope").extensions.smart_open.smart_open {
        cwd_only = true,
        filename_first = true
      }
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git files" })
    vim.keymap.set("n", "<leader>fb", function()
      builtin.buffers({
        ignore_current_buffer = true,
        sort_mru = true,
      })
    end, { desc = "Show buffers" })
    vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find,
      { desc = "Find in current buffer" })
    vim.keymap.set("n", "<leader>fas", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Grep by keyword" })
    vim.keymap.set("n", "<leader>fd", function() builtin.find_files({ cwd = utils.buffer_dir() }) end,
      { desc = "Fuzzy Finder in current dir" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Search through recently opened files" })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
    vim.keymap.set("n", "<leader>fc", function()
      builtin.colorscheme({ enable_preview = true })
    end, { desc = "Change color scheme" })
    vim.keymap.set("n", "<leader>pp", builtin.registers, { desc = "Registers" })
  end,
}
