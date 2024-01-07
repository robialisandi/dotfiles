return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "php",
        "rust",
        "sql",
        "svelte",
        "comment",
        "lua",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "html",
        "scss",
        "vue",
        "markdown",
        "markdown_inline",
      },
    },
    dependencies = {
      -- https://github.com/windwp/nvim-ts-autotag
      {
        "windwp/nvim-ts-autotag",
        opts = {
          enable_close_on_slash = false,
          filetype = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "xml",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
