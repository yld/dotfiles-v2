return {
  {
    "folke/sidekick.nvim",
    config = function(_, opts)
      require("sidekick").setup(opts)

      -- Sidekick sets up its Copilot status hooks on a scheduled callback. If
      -- the Copilot LSP client attaches during that small window, Sidekick's
      -- healthcheck can report that the status notifications are not handled.
      -- Re-attach handlers for any already-running Copilot clients once setup
      -- has completed.
      vim.schedule(function()
        local config = require("sidekick.config")
        local status = require("sidekick.status")
        for _, client in ipairs(vim.lsp.get_clients()) do
          if config.is_copilot(client) then
            status.attach(client)
          end
        end
      end)
    end,
  },
}
