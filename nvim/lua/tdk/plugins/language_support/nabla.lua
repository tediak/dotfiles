return {
  'jbyuki/nabla.nvim',
  lazy = true,
  keys = function()
    return {
      {
        '<leader>np',
        ':lua require("nabla").popup()<cr>',
        desc = 'NablaPopUp',
      },
    }
  end,
}
