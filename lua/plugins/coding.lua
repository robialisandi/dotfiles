return {
  -- Symbol Outline
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },
  -- Todo Comment
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keywords = {
      REVIEW = {
        icon = " ",
      },
    },
  },
  -- Inc Rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "InRename",
    config = true,
  },
}
