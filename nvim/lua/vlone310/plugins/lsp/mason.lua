return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver", -- JavaScript, Typescript
        "html", -- HTML
        "cssls", -- CSS, SCSS, LESS
        "tailwindcss", -- tailwindcss
        "lua_ls", -- lua
        "emmet_ls", -- emmet
        "pyright", --python
        "rust_analyzer", -- rust
        "gopls", -- go
        "spectral", -- JSON, YAML
        "dockerls", -- docker
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- JaveScript, Typescript linter
        "gopls", -- go formatter
      },
    })
  end,
}
