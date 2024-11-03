return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    mappings = {
      --- follow the link under the cursor
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    workspaces = {
      {
        name = "notes",
        path = "~/stuff/notes",
      },
    },
    -- use lazyvim markdown extras for rendering
    ui = {
      enable = false,
    },
    -- put notes on the inbox directory
    new_notes_location = "notes_subdir",
    notes_subdir = "0-inbox",
    -- note ID: title ? %Y-%m-%d_title : %Y-%m-%d_Untitled
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-_]", ""):lower()
      else
        suffix = "Untitled"
      end
      return tostring(os.date("%Y-%m-%d")) .. "_" .. suffix
    end,
    -- Open the URL in the default web browser.
    ---@param url string
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url }) -- Mac OS
    end,
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
    -- file it will be ignored but you can customize this behavior here.
    ---@param img string
    follow_img_func = function(img)
      vim.fn.jobstart({ "qlmanage", "-p", img }) -- Mac OS quick look preview
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
    end,
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
  keys = {
    {
      desc = "Open Note in Obisidian",
      "<LEADER>oo",
      "<cmd>ObsidianOpen<cr>",
    },
    {
      desc = "Create New Note",
      "<LEADER>on",
      "<cmd>ObsidianNew<cr>",
    },
    {
      desc = "Rename Note",
      "<LEADER>or",
      "<cmd>ObsidianRename<cr>",
    },
    {
      desc = "Insert Template",
      "<LEADER>oi",
      "<cmd>ObsidianTemplate<cr>",
    },
    {
      desc = "Paste Image from Clipboard",
      "<LEADER>op",
      "<cmd>ObsidianPasteImg<cr>",
    },
    {
      desc = "Search Notes",
      "<LEADER>os",
      "<cmd>ObsidianQuickSwitch<cr>",
    },
    {
      desc = "Grep Notes",
      "<LEADER>og",
      "<cmd>ObsidianSearch<cr>",
    },
    {
      desc = "Search Current Page Headings",
      "<LEADER>oc",
      "<cmd>ObsidianTOC<cr>",
    },
    {
      desc = "Search Current Page Links",
      "<LEADER>ol",
      "<cmd>ObsidianLinks<cr>",
    },
    {
      desc = "Search Backlinks",
      "<LEADER>ob",
      "<cmd>ObsidianBacklinks<cr>",
    },
    {
      desc = "Search Tags",
      "<LEADER>ot",
      "<cmd>ObsidianTags<cr>",
    },
  },
}
