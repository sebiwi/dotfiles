return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      -- The selected buffer's filetype icon gets its own dynamically generated
      -- highlight group (BufferLineDevIcon<ft>Selected). bufferline builds it at
      -- render time from its INTERNAL config.highlights.buffer_selected table --
      -- NOT from the BufferLineBufferSelected group the colorscheme's
      -- on_highlights overrides. So the icon keeps a different (transparent)
      -- background unless we set the background here too. Match base02 from the
      -- selected-tab styling in colorscheme.lua so text + icon share one bg.
      local base02 = require("solarized.palette").solarized.base02
      local base1 = require("solarized.palette").solarized.base1
      opts.highlights = opts.highlights or {}
      opts.highlights.buffer_selected = vim.tbl_extend("force", opts.highlights.buffer_selected or {}, {
        fg = base1,
        bg = base02,
        bold = true,
      })
    end,
  },
}
