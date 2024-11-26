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
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          indent = 3,
          ttl = 5,
        },
        { section = "startup" },
      },
    },
  },
}
