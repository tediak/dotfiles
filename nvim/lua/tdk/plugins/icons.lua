vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
})

local icons = require('nvim-web-devicons')

local properties_config = {
  icon = '',
}

local env_config = {
  icon = '',
}

local docker_config = {
  icon = '󰡨',
}

local key_config = {
  icon = '󰌆',
}

icons.setup({
  color_icons = false,
  override_by_filename = {
    DockerfilePipeline = docker_config,
    DockerfileProd = docker_config,
    Makefile = {
      icon = '󱁼',
    },
    ['package.json'] = {
      icon = '',
    },
    ['package-lock.json'] = {
      icon = '',
    },
    ['.prettierignore'] = {
      icon = '󰰙',
    },
    ['.prettierrc'] = {
      icon = '󰰙',
    },
  },
  override_by_extension = {
    toml = properties_config,
    properties = properties_config,
    key = key_config,
    pem = key_config,
    gpg = key_config,
    ['env.example'] = env_config,
    ['env.local'] = env_config,
    ['env.e2e'] = env_config,
    ['env.e2e-reports'] = env_config,
    ['env.ormconfig'] = env_config,
    ['env.ormconfig.example'] = env_config,
  },
})

icons.set_default_icon('', 'NvimLightGrey3', 65)
