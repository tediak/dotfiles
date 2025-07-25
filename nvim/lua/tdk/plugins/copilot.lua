return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = true,
      trigger_on_accept = true,
      keymap = {
        accept = '<c-s-y>',
        accept_word = '<c-m-y>',
        accept_line = '<c-y>',
        next = '<c-n>',
        prev = '<c-p>',
        dismiss = '<c-]>',
      },
    },
    panel = {
      enabled = false,
    },
  },
}
