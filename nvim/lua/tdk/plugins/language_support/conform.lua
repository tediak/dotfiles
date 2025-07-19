return {
  'stevearc/conform.nvim',
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      desc = "Format file"
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sql = { "sqlfluff" },
      astro = { "prettier" },
      http = { "kulala" },
      json = { "jq" }
    },
    formatters = {
      sqlfluff = {
        command = "sqlfluff",
        args = {
          "format",
          "--dialect",
          "postgres",
          "-",
        },
        stdin = true,
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
      kulala = {
        command = "kulala-fmt",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    }
  }
}
