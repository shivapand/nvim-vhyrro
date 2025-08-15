return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require 'nvim-treesitter.configs'.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

      sync_install = false,

      auto_install = true,

      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>ss",
          node_incremental = "<Leader>si",
          scope_incremental = "<Leader>sc",
          node_decremental = "<Leader>sd",
        },
      },
      textobjects = {
        select = {
          enable = true,

          lookahead = true,

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>'
          },
          include_surrounding_whitespace = true,
        },
      },
      modules = {},
      ignore_install = {},
      indent = {
        enable = true,
        disable = { 'javascriptreact' },
      },
    })
  end
}
