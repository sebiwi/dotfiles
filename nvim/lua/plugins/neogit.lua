return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    keys = {
      {
        "<LEADER>gg",
        "<cmd>Neogit<cr>",
        desc = "Neogit",
      },
      {
        "<LEADER>gf",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Diffview Current File History",
      },
      {
        mode = "v",
        "<LEADER>gf",
        ":DiffviewFileHistory<CR>",
        desc = "Diffview Current Selection History",
      },
    },
  },
}
