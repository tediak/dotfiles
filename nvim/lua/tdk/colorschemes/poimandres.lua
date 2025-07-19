return {
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1001,
  config = function()
    require('poimandres').setup({
      bold_vert_split = false,
      disable_background = true,
      disable_float_background = true,
    })
  end,
}
