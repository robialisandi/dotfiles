-- return {
--   "stevearc/conform.nvim",
--   lazy = true,
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     local conform = require("conform")
--
--     conform.setup({
--       formatters_by_ft = {
--         javascript = { "prettier" },
--         typescript = { "prettier" },
--         javascriptreact = { "prettier" },
--         typescriptreact = { "prettier" },
--         svelte = { "prettier" },
--         css = { "prettier" },
--         html = { "prettier" },
--         json = { "prettier" },
--         yaml = { "prettier" },
--         markdown = { "prettier" },
--         graphql = { "prettier" },
--         lua = { "stylua" },
--         php = { "pretty-php", "blade-formatter" },
--         blade = { "blade-formatter" },
--         python = { "isort", "black" },
--       },
--       format_on_save = {
--         lsp_fallback = true,
--         async = false,
--         timeout_ms = 1000,
--       },
--     })
--
--     vim.keymap.set({ "n", "v" }, "<leader>mp", function()
--       conform.format({
--         lsp_fallback = true,
--         async = false,
--         timeout_ms = 1000,
--       })
--     end, { desc = "Format file or range (in visual mode)" })
--   end,
-- }

local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = function()
    ---@class ConformOpts
    local opts = {
      -- LazyVim will use these option when formatting with the conform.nvim formatter
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "pint" },
        blade = { "blade-formatter", "rustywind" },
        python = { "black" },
        javacript = { "prettier" },
      },
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_error = true } },
        -- ["blade-formatter"] = {
        --   prepend_args = { "--sort-classes", "--wrap-attributes", "auto" },
        -- },
        -- blade = {
        --   meta = {
        --     url = "https://github.com/shufo/blade-formatter",
        --     description = "An opinionated blade template formatter for Laravel that respects readability.",
        --   },
        --   command = "balde-formatter",
        --   args = { "--stdin" },
        --   stdin = true,
        -- },
        pint = {
          meta = {
            url = "https://github.com/laravel/pint",
            description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
          },
          command = util.find_executable({
            vim.fn.stdpath("data") .. "/mason/bin/pint",
            "vendor/bin/pint",
          }, "pint"),
          args = { "$FILENAME" },
          stdin = false,
        },
      },
    }
    return opts
  end,
}
