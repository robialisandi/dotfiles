-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Define an autocmd group for the blade workaround
-- local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown"},
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0

    if vim.fn.match(vim.fn.expand("%:t"), "\v^s*..*$") >= 0 then
      vim.wo.conceallevel = 2
    end
  end,
})
--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e | %s/\%>2c\%<1v$//e]],
  group = TrimWhiteSpaceGrp,
})
-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   group = augroup,
--   pattern = "*.blade.php",
--   callback = function()
--     vim.bo.filetype = "php"
--   end,
-- })

-- Additional Autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      -- check if the attached client is 'intelephense'
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
          -- update treesitter parser to blade
          vim.api.nvim_buf_set_option(args.buf, "syntax", "blade")
          break
        end
      end
    end)
  end,
})
