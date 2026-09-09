return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=integration" },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        golangcilint = {
          prepend_args = { "--config", vim.fn.expand("~/.golangci.yml") },
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          go_test_args = { "-v", "-race", "-count=1", "-tags=integration" },
          go_list_args = { "-tags=integration" },
          dap_go_opts = {
            delve = {
              build_flags = { "-tags=integration" },
            },
          },
        },
      },
    },
  },
}
