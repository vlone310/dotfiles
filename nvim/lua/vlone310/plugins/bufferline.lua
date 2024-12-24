return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = "Directory",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
}
