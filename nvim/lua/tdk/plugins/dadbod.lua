return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql' },
      lazy = true,
    },
    { 'pbogut/vim-dadbod-ssh' },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1

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
  end,
}
