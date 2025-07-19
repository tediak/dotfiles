return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
  },
  keys = {
    { "<leader>nS", function() require("neotest").summary.toggle() end,            desc = "Toggle tests summary" },
    { "<leader>nO", function() require("neotest").output_panel.toggle() end,       desc = "Toggle output panel" },
    { "<leader>nt", function() require("neotest").run.run() end,                   desc = "Run nearest test" },
    { "<leader>nT", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current file" },
    -- TODO: add dap keys
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          -- NOTE: to modify npm commands depending on the project
          jestCommand = function()
            local cwd = vim.fn.getcwd()
            if vim.endswith(cwd, 'my-custom-project') then
              return "npm run my-custom-jest-command --"
            end

            return "npm test --"
          end,
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end
}
