return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  config = function()
    vim.g.rustaceanvim = {
      default_settings = {
        ["rust-analyzer"] = {
          cargo = {
            allTargets = true,
            -- target = "aarch64-apple-ios",
          },
          check = {
            command = "clippy",
          },
          diagnostics = {
            disabled = { "inactive-code" },
          },
        },
      },
    }
  end,
}
