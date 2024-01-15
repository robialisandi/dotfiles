return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
    config = function()
      require("solarized-osaka").setup({
        on_highlights = function(hl, c)
          -- Fix "unused function" highlights
          hl.TroubleNormal = {
            bg = c.bg_sidebar,
            fg = c.fg_dark,
          }
        end,
      })

      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}
