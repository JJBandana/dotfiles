return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              globals = { "Bun" },
            },
            javascript = {
              globals = { "Bun" },
            },
          },
        },
        ts_ls = { enabled = false },
      },
      setup = {
        ts_ls = function()
          return true
        end,
      },
    },
  },
}
