return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    math.randomseed(os.time())

    local function pick_color()
      local colors = { "Number", "String", "Keyword", "Constant" }
      return colors[math.random(#colors)]
    end

    local function footer()
      local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

      return datetime .. " " .. nvim_version_info
    end

    local logo1 = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    local logo2 = {
      "        ████████╗██████╗ ██╗  ██╗        ",
      "        ╚══██╔══╝██╔══██╗██║ ██╔╝        ",
      "           ██║   ██║  ██║█████╔╝         ",
      "           ██║   ██║  ██║██╔═██╗         ",
      "           ██║   ██████╔╝██║  ██╗        ",
      "           ╚═╝   ╚═════╝ ╚═╝  ╚═╝        ",
      "",
      "     ███╗   ██╗██╗   ██╗██╗███╗   ███╗     ",
      "     ████╗  ██║██║   ██║██║████╗ ████║     ",
      "     ██╔██╗ ██║██║   ██║██║██╔████╔██║     ",
      "     ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║     ",
      "     ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║     ",
      "     ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝     ",
    }

    dashboard.section.header.val = logo2
    dashboard.section.header.opts.hl = pick_color()

    dashboard.section.buttons.val = {
      dashboard.button("-", "  File Explorer"),
      dashboard.button("<Leader><Leader>", "  Find File"),
      dashboard.button("<Leader>fs", "  Live Grep"),
      dashboard.button("q", "  Quit", ":qa<cr>")
    }

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Constant"

    alpha.setup(dashboard.opts)

    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
  end
};
