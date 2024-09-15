return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim", -- optional
    },
    keys = {
      {
        "<LEADER>gg",
        "<cmd>Neogit<cr>",
        desc = "Neogit",
      },
    },
    config = true,
  },
}
