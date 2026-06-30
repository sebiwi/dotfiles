return {
  "folke/which-key.nvim",
  opts = {
    preset = "classic",
    win = {
      border = "rounded",
    },
    spec = {
      { "<leader>o", group = "obsidian" },
    },
    icons = {
      rules = {
        { plugin = "copilot.lua", icon = " ", color = "orange" },
      },
    },
  },
}
