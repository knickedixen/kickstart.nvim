-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'knickedixen/ask-claude.nvim',
    dir = '/home/knickedixen/workspace/nvim-plugins/ask-claude.nvim/',
    config = function()
      vim.keymap.set('n', '<C-a>', '<cmd>AskClaude<CR>')
      vim.keymap.set('c', '<C-a>', '<cmd>AskClaude<CR>')
      vim.keymap.set('t', '<C-a>', '<cmd>AskClaude<CR>')
      vim.keymap.set('n', '<leader>ac', '<cmd>AskClaudeContext<CR>')
      vim.keymap.set('n', '<leader>ad', '<cmd>AskClaudeDiagnostics<CR>')
      vim.keymap.set('v', '<leader>ad', '<cmd>AskClaudeDiagnostics<CR>')
      vim.keymap.set('v', '<leader>ae', '<cmd>AskClaudeContext<CR>')
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'luukvbaal/statuscol.nvim',
    config = function()
      -- Custom function to show both absolute and relative line numbers
      local function lnum_both()
        local lnum = vim.v.lnum
        local relnum = vim.v.lnum == vim.fn.line '.' and 0 or math.abs(vim.v.lnum - vim.fn.line '.')
        return string.format('%3d %2d', lnum, relnum)
      end
      require('statuscol').setup {
        setopt = true,
        segments = {
          {
            sign = {
              namespace = { 'gitsigns.*' },
              name = { 'gitsigns.*' },
            },
          },
          {
            sign = {
              namespace = { '.*' },
              name = { '.*' },
              auto = true,
            },
          },
          {
            text = { lnum_both, ' ' },
            condition = { true },
            click = 'v:lua.ScLa',
          },
        },
      }
    end,
  },
}
