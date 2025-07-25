return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  dependencies = {
    'nvim-orgmode/org-bullets.nvim',
  },
  config = function()
    require('orgmode').setup({
      -- Defaults
      org_default_notes_file = '~/my/roam/000-refile.org',
      org_todo_keywords = {
        'TODO(t)',
        'PROGRESS(p)',
        'HOLD(h)',
        '|',
        'DONE(d!)',
        'CANCELED(c!)',
      },
      org_todo_keyword_faces = {
        TODO = ':foreground red :weight bold',
        PROGRESS = ':foreground cyan :weight bold',
        HOLD = ':foreground grey :weight bold',
        CANCELED = ':foreground grey :weight bold',
        DONE = ':foreground #00ff00 :weight bold',
      },
      win_split_mode = 'float', -- '100vsplit'},
      org_startup_folded = 'overview',
      org_hide_leading_stars = true,
      org_ellipsis = ' [..]',
      org_startup_indented = true,
      org_hide_emphasis_markers = true,
      org_log_into_drawer = 'LOGBOOK',
      org_use_tag_inheritance = false,

      -- Agenda settings
      org_agenda_files = '~/my/roam/**/*',
      org_agenda_skip_scheduled_if_done = true,
      org_agenda_skip_deadline_if_done = true,
      org_agenda_custom_commands = {
        c = {
          description = 'Combined view',
          types = {
            {
              org_agenda_overriding_header = 'Daily Agenda',
              type = 'agenda',
              org_agenda_span = 'day',
              org_agenda_start_on_weekday = false,
            },
            {
              org_agenda_overriding_header = 'High Priority TODOs',
              type = 'tags_todo',
              match = 'PRIORITY="A"',
              org_agenda_todo_ignore_deadlines = 'far',
            },
            {
              org_agenda_overriding_header = 'Work TODOs',
              type = 'tags_todo',
              match = 'CATEGORY="work"',
            },
            {
              org_agenda_overriding_header = 'Vault-related TODOs',
              type = 'tags',
              match = 'vault',
            },
            {
              org_agenda_overriding_header = 'Week Overview',
              type = 'agenda',
              org_agenda_span = 'week',
              org_agenda_start_on_weekday = false,
              org_agenda_start_day = '-2d',
              org_agenda_remove_tags = true,
            },
          },
        },
      },

      -- Capture templates
      org_capture_templates = {
        n = {
          description = 'Note',
          template = '** %^{Title|New Entry}\n%U\n%?',
          headline = 'Inbox',
          properties = {
            empty_lines = 1,
          },
        },
        l = {
          description = 'Link',
          template = '** %?\n[[%x][%(return string.match(string.gsub(\'%x\', \'/$\', \'\'), \'([^/]+)$\') or \'%x\')]]',
          target = '~/my/roam/000-refile.org',
          headline = 'Inbox',
          properties = {
            empty_lines = 1,
          },
        },
        t = 'Task',
        tp = {
          description = 'Personal',
          template = '** TODO %?',
          target = '~/my/roam/002-tasks.org',
          headline = 'Personal',
          properties = {
            empty_lines = 1,
          },
        },
        tw = {
          description = 'Work',
          template = '** TODO %?',
          target = '~/my/roam/002-tasks.org',
          headline = 'Work',
          properties = {
            empty_lines = 1,
          },
        },
        tr = {
          description = 'Productivity',
          template = '** TODO %?',
          target = '~/my/roam/002-tasks.org',
          headline = 'Productivity',
          properties = {
            empty_lines = 1,
          },
        },
      },

      -- Mappings
      mappings = {},

      -- Notifications
      notifications = {
        enabled = true,
        -- TODO: configure system notifications
        cron_enabled = false,
        repeater_reminder_time = { 120, 60, 30 },
        deadline_warning_reminder_time = { 120, 60, 30, 10 },
        reminder_time = { 120, 60, 30 },
      },
    })

    -- Meta-return in insert mode
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'org',
      callback = function()
        vim.keymap.set('i', '<s-cr>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
          silent = true,
          buffer = true,
        })
      end,
    })

    -- Better bullet points
    require('org-bullets').setup({
      concealcursor = true,
      symbols = {
        headlines = { '●' },
        list = '•',
        checkboxes = {
          half = { '-', '@org.checkbox.halfchecked' },
          done = { '✓', '@org.keyword.done' },
          todo = { ' ', '@org.keyword.todo' },
        },
      },
    })
  end,
}
