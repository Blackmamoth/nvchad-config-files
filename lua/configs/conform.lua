local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofumpt", "goimports_reviser", "golines" },
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "mypy", "ruff_format" }
      else
        return { "mypy", "isort", "black" }
      end
    end,
    typescript = { "eslint", "prettier" },
    javascript = { "eslint", "prettier" },
    bash = { "shfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
