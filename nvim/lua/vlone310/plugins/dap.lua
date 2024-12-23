return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")
    local keymap = vim.keymap
    local dap_go = require("dap-go")

    dapui.setup()
    dap_go.setup()
    dap_virtual_text.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Keymaps for dap
    keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue debugging" })
    keymap.set("n", "<F9>", dap.step_over, { desc = "Step over" })
    keymap.set("n", "<F8>", dap.step_into, { desc = "Step into" })
    keymap.set("n", "<F7>", dap.step_out, { desc = "Step out" })
    keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set conditional breakpoint" })
    keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
    keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last debug session" })

    -- customizations
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "⛔", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
  end,
}
