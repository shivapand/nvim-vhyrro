vim.keymap.set({ 'i', 'n' }, '<C-s>', '<ESC>:silent w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<Leader>j', ':execute "tabmove" tabpagenr() - 2<CR>', { desc = 'Move tab prev' })
vim.keymap.set('n', '<Leader>k', ':execute "tabmove" tabpagenr() + 1<CR>', { desc = 'Move tab next' })

vim.keymap.set('n', '<Leader>/', ':noh<CR>', { desc = 'Clear search highlight' })

vim.keymap.set('n', '<Leader>g', ':call system("xclip -i -selection clipboard", expand("%:~:."))<CR>',
  { desc = 'Copy file path' })

vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = "Next Diagnostic" })

vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = "Previous Diagnostic" })

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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gn', vim.lsp.buf.rename, '[R]e[n]ame')

    map('ga', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')

    map('gi', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')

    map('gd', function()
      vim.lsp.buf.definition({
        on_list = function(options)
          if #options.items > 1 then
            vim.notify("Multiple items found, opening first one", vim.log.levels.WARN)
          end

          vim.cmd("tab split")
          vim.lsp.buf.definition()
        end,
      })
    end, '[G]oto [D]efinition')

    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    map('gO', require('fzf-lua').lsp_document_symbols, 'Open Document Symbols')

    map('gW', require('fzf-lua').lsp_live_workspace_symbols, 'Open Workspace Symbols')

    map('gt', require('fzf-lua').lsp_typedefs, '[G]oto [T]ype Definition')
  end,
})

