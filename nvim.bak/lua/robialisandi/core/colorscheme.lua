vim.cmd("colorscheme nightfly")

vim.g.nightflyTransparent = true

local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
    print("Colorscheme not found!")
    return
end
