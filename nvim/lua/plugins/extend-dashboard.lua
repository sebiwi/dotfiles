return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      --       preset = {
      --         header = [[
      -- ██████╗  ██████╗     ██╗████████╗
      -- ██╔══██╗██╔═══██╗    ██║╚══██╔══╝
      -- ██║  ██║██║   ██║    ██║   ██║
      -- ██║  ██║██║   ██║    ██║   ██║
      -- ██████╔╝╚██████╔╝    ██║   ██║
      -- ╚═════╝  ╚═════╝     ╚═╝   ╚═╝
      --
      --         ]],
      --       },
      sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 1 },
        {
          section = "terminal",
          icon = " ",
          title = "Git Status",
          enabled = vim.fn.isdirectory(".git") == 1,
          cmd = "hub diff --stat -B -M -C",
          height = 5,
          padding = 1,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
