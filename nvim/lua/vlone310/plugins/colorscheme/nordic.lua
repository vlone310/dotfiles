return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nordic").load({
      telescope = {
        style = "flat",
      },
      ts_context = {
        dark_background = true,
      },
      transparent = {
        bg = false,
        float = false,
      },
      on_palette = function(palette)
        palette.black0 = "#14181F"
        palette.black1 = "#191D24"
        palette.black2 = "#1E222A"
        palette.gray0 = "#222630"
        palette.gray1 = "#242933"
        palette.gray2 = "#2E3440"
        palette.gray3 = "#3B4252"
        palette.gray4 = "#434C5E"
        palette.gray5 = "#4C566A"
      end,
      on_highlight = function(highlights, palette)
        highlights.NeoTreeGitAdded = { fg = palette.green.dim }
        highlights.NeoTreeGitModified = { fg = palette.yellow.bright }
        highlights.NeoTreeGitDeleted = { fg = palette.red.bright }
        highlights.NeoTreeGitConflict = { fg = palette.orange.bright }
        highlights.NeoTreeGitUntracked = { fg = palette.green.bright }
        highlights.FloatBorder = { fg = palette.yellow.base }
        highlights.TelescopeBorder = { fg = palette.yellow.base }
        highlights.TelescopePromptBorder = { fg = palette.yellow.base }
        highlights.TelescopeResultsBorder = { fg = palette.yellow.base }
        highlights.TelescopePreviewBorder = { fg = palette.yellow.base }
      end,
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.diagnostic.config({
      float = { border = "rounded" },
    })

    vim.cmd.colorscheme("nordic")
  end,
}
