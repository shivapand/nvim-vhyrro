vim.keymap.set({ 'i', 'n' }, '<C-s>', '<ESC>:silent w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<Leader>j', ':execute "tabmove" tabpagenr() - 2<CR>', { desc = 'Move tab prev' })
vim.keymap.set('n', '<Leader>k', ':execute "tabmove" tabpagenr() + 1<CR>', { desc = 'Move tab next' })

vim.keymap.set('n', '<Leader>/', ':noh<CR>', { desc = 'Clear search highlight' })

vim.keymap.set('n', '<Leader>g', ':call system("xclip -i -selection clipboard", expand("%:~:."))<CR>',
  { desc = 'Copy file path' })

vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = "Next Diagnostic" })

vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = "Previous Diagnostic" })

vim.keymap.set("n", "gd", function()
  vim.cmd("tab split")
  vim.lsp.buf.definition()
end, { desc = "Go to definition in new tab" })

vim.keymap.set("n", "<C-a>", function()
  require("conform").format({
    lsp_format = "fallback",
  })
end, { desc = "Format current file" })

vim.keymap.set("v", "<leader>a", function()
  require("conform").format({
    lsp_format = "fallback",
  })
end, { desc = "Format current file" })

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
