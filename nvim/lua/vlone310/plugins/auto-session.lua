return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_session_suppress_dirs = { "~/", "~/Downloads/", "~/Documents/", "~/Desktop/" },
      pre_save_cmds = { "Neotree close" },
      post_restore_cmds = { "Neotree filesystem show" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root directory" })
  end,
}
