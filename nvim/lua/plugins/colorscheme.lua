return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized",
    },
  },
  {
    "maxmx03/solarized.nvim",
    opts = {
      variant = "summer", -- "spring" | "summer" | "autumn" | "winter" (default)
      transparent = {
        enabled = true, -- Master switch to enable transparency
        pmenu = true, -- Popup menu (e.g., autocomplete suggestions)
        normal = true, -- Main editor window background
        normalfloat = true, -- Floating windows
        neotree = true, -- Neo-tree file explorer
        nvimtree = true, -- Nvim-tree file explorer
        whichkey = true, -- Which-key popup
        telescope = true, -- Telescope fuzzy finder
        lazy = true, -- Lazy plugin manager UI
        mason = true, -- Mason manage external tooling
      },
      on_highlights = function(colors, _)
        -- Make the selected bufferline tab clearly stand out. The default
        -- solarized highlights only set a foreground, so the active buffer
        -- blends into the inactive/visible ones. Give the whole selected tab
        -- a distinct background + bold accent (like tokyonight does).
        local sel = { bg = colors.base02, bold = true }
        return {
          MatchParen = { reverse = true },
          -- The theme leaves the float border background transparent while the
          -- body is solid (base04), which shows the terminal bg on the border
          -- row. Give the border the same solid bg so the popup edge matches.
          FloatBorder = { fg = colors.cyan, bg = colors.base04 },
          -- blink.cmp paints its menu/docs with its own highlight groups
          -- rather than Pmenu, so the solarized `pmenu` transparency flag
          -- doesn't reach it. Force the backgrounds transparent here.
          BlinkCmpMenu = { bg = "NONE" },
          BlinkCmpMenuBorder = { fg = colors.cyan, bg = "NONE" },
          BlinkCmpDoc = { bg = "NONE" },
          BlinkCmpDocBorder = { fg = colors.cyan, bg = "NONE" },
          BlinkCmpDocSeparator = { bg = "NONE" },
          BlinkCmpSignatureHelp = { bg = "NONE" },
          BlinkCmpSignatureHelpBorder = { fg = colors.cyan, bg = "NONE" },
          LspReferenceRead = { fg = colors.cyan, bg = colors.base02, standout = true },
          LspReferenceWrite = { fg = colors.blue, bg = colors.base02, standout = true },
          BufferLineBufferSelected = vim.tbl_extend("force", { fg = colors.base1 }, sel),
          BufferLineNumberSelected = vim.tbl_extend("force", { fg = colors.base1 }, sel),
          BufferLineModifiedSelected = vim.tbl_extend("force", { fg = colors.green }, sel),
          BufferLineDuplicateSelected = vim.tbl_extend("force", { fg = colors.base0 }, sel),
          BufferLineCloseButtonSelected = vim.tbl_extend("force", { fg = colors.base1 }, sel),
          BufferLinePickSelected = vim.tbl_extend("force", { fg = colors.red }, sel),
          BufferLineIndicatorSelected = vim.tbl_extend("force", { fg = colors.blue }, sel),
          -- Use a mid-tone fg so the slants flanking the active tab are
          -- actually visible against its base02 background (base03 was darker
          -- than the surrounding fill and disappeared).
          BufferLineSeparatorSelected = { fg = colors.base01, bg = colors.base02 },
          BufferLineDiagnosticSelected = vim.tbl_extend("force", { fg = colors.base1 }, sel),
          BufferLineErrorSelected = vim.tbl_extend("force", { fg = colors.red }, sel),
          BufferLineErrorDiagnosticSelected = vim.tbl_extend("force", { fg = colors.red }, sel),
          BufferLineWarningSelected = vim.tbl_extend("force", { fg = colors.yellow }, sel),
          BufferLineWarningDiagnosticSelected = vim.tbl_extend("force", { fg = colors.yellow }, sel),
          BufferLineInfoSelected = vim.tbl_extend("force", { fg = colors.blue }, sel),
          BufferLineInfoDiagnosticSelected = vim.tbl_extend("force", { fg = colors.blue }, sel),
          BufferLineHintSelected = vim.tbl_extend("force", { fg = colors.cyan }, sel),
          BufferLineHintDiagnosticSelected = vim.tbl_extend("force", { fg = colors.cyan }, sel),
        }
      end,
    },
  },
  -- {
  --   "tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     style = "storm",
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
}
