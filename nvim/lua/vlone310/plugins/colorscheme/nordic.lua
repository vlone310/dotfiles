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

      after_palette = function(palette)
        palette.bg = palette.black2
      end,
      on_highlight = function(highlights, palette)
        highlights.NeoTreeGitAdded = { fg = palette.green.dim }
        highlights.NeoTreeGitModified = { fg = palette.yellow.bright }
        highlights.NeoTreeGitDeleted = { fg = palette.red.bright }
        highlights.NeoTreeGitConflict = { fg = palette.orange.bright }
        highlights.NeoTreeGitUntracked = { fg = palette.green.bright }
        highlights.FloatBorder = { fg = palette.yellow.base }
        highlights.TelescopeBorder = { fg = palette.yellow.base, bg = palette.black3 }
        highlights.TelescopePromptBorder = { fg = palette.yellow.base, bg = palette.black3 }
        highlights.TelescopeResultsBorder = { fg = palette.yellow.base, bg = palette.black3 }
        highlights.TelescopePreviewBorder = { fg = palette.yellow.base, bg = palette.black3 }
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
