return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
    "mxsdev/nvim-dap-vscode-js",
  },
  config = function()
    require("dap-go").setup()
    require("dap-python").setup("~/.venvs/debugpy/bin/python")
    require("dap-vscode-js").setup({
      debugger_path = "(stdpath('data'))/mason/vscode-js-debug",
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })

    local dap = require("dap")
    local dapui = require("dapui")

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Debugger: toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debugger: start/continue" })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
