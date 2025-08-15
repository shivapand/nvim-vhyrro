return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    }
  },
  config = function()
    require('mason-lspconfig').setup({
      vim.diagnostic.config({
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        },
        update_in_insert = true,
        virtual_text = false
      })
    })

    require("mason-tool-installer").setup({ 
      ensure_installed = {
        'lua-language-server',
        'eslint-lsp',
        'prettier',
        'emmet-language-server',
        'stylelint-lsp'
      }
    })
  end
}
