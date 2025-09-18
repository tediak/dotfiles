vim.pack.add({ 'https://github.com/goolord/alpha-nvim' })

local alpha = require('alpha')
local startify = require('alpha.themes.startify')

alpha.setup(startify.config)
