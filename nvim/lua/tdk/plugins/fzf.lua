vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
})

local fzf = require('fzf-lua')

fzf.setup({
  defaults = {
    file_icons = false,
    git_icons = false,
    winopts = {
      height = 0.3,
      width = 1.0,
      row = 1.0,
      border = 'none',
      preview = {
        border = false,
      },
    },
  },
  keymap = {
    fzf = {
      ['ctrl-d'] = 'half-page-down',
      ['ctrl-u'] = 'half-page-up',
    },
  },
})

-- Use fzf-lua picker as default one instead of vim.ui.select
fzf.register_ui_select()

vim.keymap.set('n', '<c-space>', '<cmd>FzfLua resume<cr>', { desc = 'Resume last picker' })

vim.keymap.set(
  'n',
  '<leader><leader>',
  function()
    fzf.files({
      prompt = '> ',
      cwd_only = true,
      previewer = false,
      cwd_prompt = false,
      cwd_header = true,
      formatter = 'path.filename_first',
    })
  end,
  { desc = 'Go to file' }
)

vim.keymap.set(
  'n',
  '<c-b>',
  function() fzf.buffers({ prompt = 'buffers> ', previewer = true }) end,
  { desc = 'Go to buffer' }
)

vim.keymap.set(
  'n',
  '<leader>fs',
  function()
    fzf.grep({
      previewer = true,
      glob_pattern = '*',
    })
  end,
  { desc = 'Search in files (grep for string)' }
)

vim.keymap.set(
  'n',
  '<leader>ff',
  function()
    fzf.live_grep_native({
      previewer = true,
      glob_pattern = '*',
      formatter = 'path.filename_first',
    })
  end,
  { desc = 'Search in files (live mode)' }
)

vim.keymap.set('n', 'grr', fzf.lsp_references, { desc = 'Show LSP references' })

vim.keymap.set(
  'n',
  'grR',
  function()
    fzf.lsp_references({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP references (vertical split)' }
)

vim.keymap.set('n', 'grd', fzf.lsp_definitions, { desc = 'Show LSP definitions' })

vim.keymap.set(
  'n',
  'grD',
  function()
    fzf.lsp_definitions({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP definitions (vertical split)' }
)

vim.keymap.set('n', 'gri', fzf.lsp_implementations, { desc = 'Show LSP implementations' })

vim.keymap.set(
  'n',
  'grI',
  function()
    fzf.lsp_implementations({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP definitions (vertical split)' }
)

vim.keymap.set('n', 'grt', fzf.lsp_typedefs, { desc = 'Show LSP type definitions' })

vim.keymap.set(
  'n',
  'grT',
  function()
    fzf.lsp_typedefs({
      jump1_action = fzf.actions.file_vsplit,
    })
  end,
  { desc = 'Show LSP type definitions (vertical split)' }
)

vim.keymap.set(
  'n',
  '<leader>gb',
  function()
    fzf.git_branches({
      cmd = 'git branch --color',
    })
  end,
  { desc = 'View git branches' }
)

vim.keymap.set(
  'n',
  '<leader>tC',
  function()
    fzf.colorschemes({
      prompt = 'colorscheme> ',
      winopts = {
        height = 0.3,
        width = 0.2,
        row = 1.0,
        border = 'none',
        preview = {
          border = false,
        },
      },
    })
  end,
  { desc = 'Switch colorscheme' }
)

local function color_status(status)
  if status == 'To Do' then
    return '\27[90m' .. string.format('%-15s', status) .. '\27[0m'
  elseif status == 'In Progress' then
    return '\27[34m' .. string.format('%-15s', status) .. '\27[0m'
  elseif status == 'Testing' then
    return '\27[35m' .. string.format('%-15s', status) .. '\27[0m'
  elseif status == 'READY FOR QA' then
    return '\27[32m' .. string.format('%-15s', status) .. '\27[0m'
  else
    return string.format('%-15s', status)
  end
end

local function strip_ansi(str) return str:gsub('\27%[[%d;]*m', '') end

local function get_jira_tasks()
  local url = vim.g.jira_url
  local email = vim.g.jira_email
  local token = vim.g.jira_token

  if not (url and email and token) then
    vim.notify(
      'Jira integration not configured. Please set vim.g.jira_url, vim.g.jira_email, and vim.g.jira_token.',
      vim.log.levels.WARN
    )
    return
  end

  local all_issues = {}
  local page_token = nil
  local is_last = false

  while not is_last do
    local api_url =
      string.format('%s/rest/api/3/search/jql?jql=status!=Done&fields=id,summary,status,assignee,labels', url)
    if page_token then api_url = api_url .. '&nextPageToken=' .. page_token end

    local curl_cmd = string.format(
      'curl -s -H \'Content-Type: application/json\' -H \'Accept: application/json\' \'%s\' --basic --user \'%s:%s\'',
      api_url,
      email,
      token
    )

    local result = nil
    local handle = io.popen(curl_cmd)
    if handle then
      result = handle:read('*a')
      handle:close()
    else
      vim.notify('Failed to open handle', vim.log.levels.ERROR)
      return
    end

    if not result or result == '' then
      vim.notify('No response from Jira API.', vim.log.levels.ERROR)
      return
    end

    local ok, decoded = pcall(vim.fn.json_decode, result)
    if not ok or not decoded or not decoded.issues then
      vim.notify('Failed to decode Jira response.', vim.log.levels.ERROR)
      return
    end

    -- Append issues
    for _, issue in ipairs(decoded.issues) do
      table.insert(all_issues, issue)
    end

    is_last = decoded.isLast or false
    page_token = decoded.nextPageToken
    if #decoded.issues == 0 or is_last or not page_token then break end
  end

  local tasks = {}
  local key_to_url = {}
  for _, issue in ipairs(all_issues) do
    local key = tostring(issue.key or '')
    local colored_key = '\27[34m' .. string.format('%-10s', key) .. '\27[0m'
    local summary = tostring(issue.fields.summary or '')
    local status = tostring((issue.fields.status and issue.fields.status.name) or 'Unknown')
    local colored_status = color_status(status)
    local labels = issue.fields.labels or {}
    local colored_formatted_labels = ''
    if #labels > 0 then colored_formatted_labels = ' \27[31m' .. table.concat(labels, ', ') .. '\27[0m' end
    local assignee = 'Unassigned'
    if
      type(issue.fields.assignee) == 'table'
      and issue.fields.assignee.displayName
      and issue.fields.assignee.displayName ~= ''
    then
      assignee = tostring(issue.fields.assignee.displayName)
    end
    local colored_assignee = '\27[32m' .. string.format('@%s', assignee) .. '\27[0m'
    local entry = string.format(
      '%-11s  %-13s %-30s  %s %s',
      colored_key,
      colored_status,
      colored_assignee,
      summary,
      colored_formatted_labels
    )
    key_to_url[key] = string.format('%s/browse/%s', url, key)
    table.insert(tasks, entry)
  end

  if #tasks == 0 then
    vim.notify('No Jira tasks found.', vim.log.levels.INFO)
    return
  end

  fzf.fzf_exec(tasks, {
    prompt = 'Issues> ',
    header = {
      '\27[90m<c-i> copy key; <c-y> copy url\27[0m',
    },
    actions = {
      ['default'] = function(selected)
        local entry = selected[1]
        local plain = strip_ansi(entry)
        local key = plain:match('^(%S+)')
        local issue_url = key_to_url[key]
        if issue_url then
          vim.fn.jobstart({ 'open', issue_url }, { detach = true })
        else
          vim.notify('No URL found for selected issue.', vim.log.levels.ERROR)
        end
      end,
      ['ctrl-y'] = function(selected)
        local entry = selected[1]
        local plain = strip_ansi(entry)
        local key = plain:match('^(%S+)')
        local issue_url = key_to_url[key]
        if issue_url then
          vim.fn.setreg('+', issue_url)
          vim.notify('Copied issue URL to clipboard: ' .. issue_url, vim.log.levels.INFO)
        else
          vim.notify('No URL found for selected issue.', vim.log.levels.ERROR)
        end
      end,
      ['ctrl-i'] = function(selected)
        local entry = selected[1]
        local plain = strip_ansi(entry)
        local key = plain:match('^(%S+)')
        if key then
          vim.fn.setreg('+', key)
          vim.notify('Copied issue key to clipboard: ' .. key, vim.log.levels.INFO)
        else
          vim.notify('No issue key found.', vim.log.levels.ERROR)
        end
      end,
    },
    fzf_opts = {
      ['--ansi'] = '',
    },
  })
end

vim.api.nvim_create_user_command('Jira', get_jira_tasks, { desc = 'Show Jira tasks' })
