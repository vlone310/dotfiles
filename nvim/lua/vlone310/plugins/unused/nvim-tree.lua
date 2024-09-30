return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
        highlight_git = true,
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.schedule(function()
          vim.cmd([[
      :hi NvimTreeGitDirty guifg=#e5c07b
      :hi NvimTreeGitStaged guifg=#98c379
      :hi NvimTreeGitMerge guifg=#e06c75
      :hi NvimTreeGitRenamed guifg=#61afef
      :hi NvimTreeGitNew guifg=#d19a66
      :hi NvimTreeGitDeleted guifg=#be5046
      :hi NvimTreeGitIgnored guifg=#7f848e
    ]])
        end)
      end,
    })
    -- Set custom Git highlight colors after the plugin is loaded
    -- vim.schedule(function()
    --   vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#e5c07b" }) -- VSCode yellow for modified files
    --   vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { fg = "#98c379" }) -- VSCode green for staged files
    --   vim.api.nvim_set_hl(0, "NvimTreeGitMerge", { fg = "#e06c75" }) -- VSCode red for conflicts
    --   vim.api.nvim_set_hl(0, "NvimTreeGitRenamed", { fg = "#61afef" }) -- VSCode blue for renamed files
    --   vim.api.nvim_set_hl(0, "NvimTreeGitNew", { fg = "#d19a66" }) -- VSCode orange for new files
    --   vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#be5046" }) -- VSCode dark red for deleted files
    --   vim.api.nvim_set_hl(0, "NvimTreeGitIgnored", { fg = "#7f848e" }) -- VSCode gray for ignored files
    -- end)
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}
