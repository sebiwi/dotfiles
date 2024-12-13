return {
  "folke/which-key.nvim",
  opts = {
    preset = "classic",
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
