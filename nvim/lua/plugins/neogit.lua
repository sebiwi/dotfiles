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
        function()
          local start_line, end_line =
            math.min(vim.fn.line("."), vim.fn.line("v")), math.max(vim.fn.line("."), vim.fn.line("v"))
          vim.cmd(string.format("%d,%d DiffviewFileHistory", start_line, end_line))
        end,
        desc = "Diffview Current Selection History",
      },
    },
  },
}
