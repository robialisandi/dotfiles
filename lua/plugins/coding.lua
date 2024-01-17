-- Disabled autocomplete cmp
local cmp = require("cmp")
cmp.setup({
  completion = {
    autocomplete = false,
  },
  mapping = {
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    { name = "codeium" },
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      item.menu = ({
        codeium = "Codeium",
        nvim_lsp = item.kind,
        luasnip = "Snippet",
        buffer = "Buffer",
        path = "Path",
      })[entry.source.name]
      local icons = require("tvl.core.icons")
      if icons.kinds[item.kind] then
        item.kind = icons.kinds[item.kind]
      end
      if entry.source.name == "codeium" then
        item.kind = icons.misc.codeium
        item.kind_hl_group = "CmpItemKindVariable"
      end
      return item
    end,
  },
})

return {
  -- Create annotations with one keybind, and jump your cursor in then inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },
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
    opts = {
      keywords = {
        FIX = {
          alt = { "MYFIX" },
        },
        TODO = {
          alt = { "MYTODO", "REVIEW" },
        },
        WARN = {
          alt = { "MYWARN" },
        },
        NOTE = {
          alt = { "MYNOTE" },
        },
        PERF = {
          color = "perk",
        },
      },
      merge_keywords = true,
      colors = {
        error = { "#ba2020" },
        info = { "#2460e3" },
        hint = { "#1ac75f" },
        perk = { "#6a46fa" },
      },
    },
  },
  {
    "folke/trouble.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "right",
      height = 15,
      width = 40,
    },
  },
  -- Inc Rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "InRename",
    config = true,
  },
  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
}
