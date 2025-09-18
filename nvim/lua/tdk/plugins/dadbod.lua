vim.pack.add({
  'https://github.com/tpope/vim-dadbod',
  'https://github.com/kristijanhusak/vim-dadbod-ui',
  'https://github.com/kristijanhusak/vim-dadbod-completion',
  'https://github.com/pbogut/vim-dadbod-ssh'
})

vim.g.db_ui_use_nerd_fonts = 0
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_table_helpers = {
  postgresql = {
    Count = 'SELECT COUNT(*) FROM "{table}"',
  },
}

vim.g.db_ui_icons = {
  expanded = '+',
  collapsed = '-',
  saved_query = '*',
  new_query = '+',
  tables = '~',
  buffers = '»',
  connection_ok = '✓',
  connection_error = '✕',
}

-- NOTE: It's better to specify database credentials in a project-specific config file, see :help exrc
-- WARN: Do not forget to include the file in .gitignore

-- vim.g.dbs = {
--   -- Example connection: PostgreSQL
--   my_postgres = 'postgres://user:password@localhost:5432/mydatabase',
--   -- Example connection: MySQL
--   my_mysql = 'mysql://user:password@localhost:3306/mydatabase',
--   -- Example connection: SQLite
--   my_sqlite = 'sqlite:///path/to/database.sqlite3',
-- }
