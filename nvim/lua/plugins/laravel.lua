return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvimtools/none-ls.nvim",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>pa", ":Laravel artisan<cr>" },
    { "<leader>pr", ":Laravel routes<cr>" },
    { "<leader>pm", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  config = true,
}
