return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    local borderColor = "#B4BEFE"

    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      highlight_overrides = {
        all = function(colors)
          return {
            FloatBorder = { fg = borderColor },
            PmenuBorder = { fg = borderColor },
          }
        end,
      },
    })

    -- Customize the hover behavior to include the border
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.diagnostic.config({
      float = { border = "rounded" },
    })

    vim.cmd.colorscheme("catppuccin")

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = borderColor }) -- Example: gold border color
      end,
    })
  end,
}
