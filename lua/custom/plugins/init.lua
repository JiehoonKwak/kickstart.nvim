-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- GitHub Copilot integration
  {
    'github/copilot.vim',
    event = 'VimEnter',
    config = function()
      -- Enable copilot for specific filetypes
      vim.g.copilot_filetypes = {
        ['*'] = true,
      }
    end,
  },
  
  -- Inline git diff viewer
  {
    'axkirillov/unified.nvim',
    cmd = 'Unified',
    keys = {
      { '<leader>gu', '<cmd>Unified<cr>', desc = '[G]it [U]nified diff view' },
      { '<leader>gr', '<cmd>Unified reset<cr>', desc = '[G]it [R]eset unified view' },
      { ']h', function() require('unified.navigation').next_hunk() end, desc = 'Next git hunk' },
      { '[h', function() require('unified.navigation').previous_hunk() end, desc = 'Previous git hunk' },
    },
    config = function()
      require('unified').setup({
        -- Disable file tree if you prefer just inline diffs
        enable_file_tree = false,
        -- Customize gutter signs
        signs = {
          add = '+',
          change = '~',
          delete = '-',
        },
      })
    end,
  },
}
