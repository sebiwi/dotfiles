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
      {
        "<leader>gl",
        function()
          local file = vim.fn.expand("%")
          require("neogit").action("log", "log_current", { "--", file })()
        end,
        desc = "Neogit Log for this file",
      },
      {
        "<leader>gl",
        function()
          local file = vim.fn.expand("%")
          vim.cmd([[execute "normal! \<ESC>"]])
          local line_start = vim.fn.getpos("'<")[2]
          local line_end = vim.fn.getpos("'>")[2]
          require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
        end,
        desc = "Neogit Log for this range",
        mode = "v",
      },
      {
        "<LEADER>gf",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Current File History",
      },
    },
    config = true,
  },
}
