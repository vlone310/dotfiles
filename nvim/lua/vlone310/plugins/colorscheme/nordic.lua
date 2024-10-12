return {
  "AlexvZyl/nordic.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local borderColor = "E7C173"

    require("nordic").load({
      telescope = {
        -- Available styles: `classic`, `flat`.
        style = "classic",
      },
      ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
      },
      transparent = {
        -- Enable transparent background.
        bg = true,
        -- Enable transparent background for floating windows.
        float = true,
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.diagnostic.config({
      float = { border = "rounded" },
    })

    vim.cmd.colorscheme("nordic")

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = borderColor }) -- Example: gold border color
      end,
    })
  end,
}
