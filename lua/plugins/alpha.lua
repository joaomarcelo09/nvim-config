return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
  "  _   _                      ____      __     __                   _   _       _   _      U  ___ u ",
  " | \\ |\"|         ___      U |  _\"\\ u   \\ \\   /\"/u       ___       | \\ |\"|     |'| |'|      \\/\"_ \\/ ",
  "<|  \\| |>       |_\"_|      \\| |_) |/    \\ \\ / //       |_\"_|     <|  \\| |>   /| |_| |\\     | | | | ",
  "U| |\\  |u        | |        |  _ <      /\\ V /_,-.      | |      U| |\\  |u   U|  _  |u .-,_| |_| | ",
  " |_| \\_|       U/| |\\u      |_| \\_\\    U  \\_/-(_/     U/| |\\u     |_| \\_|     |_| |_|   \\_)-\\___/  ",
  " ||   \\\\,-. .-,_|___|_,-.   //   \\\\_     //        .-,_|___|_,-.  ||   \\\\,-.  //   \\\\        \\\\    ",
  "(_\")  (_/   \\_)-' '-(_/   (__)  (__)   (__)        \\_)-' '-(_/   (_\")  (_/  (_\") (\"_)      (__)    ",
  "                               ☕ powered by café + vibes                                           ",
}

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button(",", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("<Space>ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("<Space>fg", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("u", "󰚰  > Update packages", "<cmd>Lazy<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    alpha.setup(dashboard.opts)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    
  end,
}

