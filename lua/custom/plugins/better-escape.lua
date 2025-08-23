return {
  'max397574/better-escape.nvim',
  event = 'InsertEnter', -- Only load when entering insert mode
  config = function()
    require('better_escape').setup {
      timeout = 200, -- Time between key presses in milliseconds
      default_mappings = true,
      mappings = {
        i = { -- Insert mode mappings
          j = {
            k = '<Esc>', -- jk -> Escape
          },
          k = {
            j = '<Esc>', -- kj -> Escape (alternative)
          },
        },
        c = { -- Command mode mappings  
          j = {
            k = '<Esc>',
          },
          k = {
            j = '<Esc>',
          },
        },
        t = { -- Terminal mode mappings
          j = {
            k = '<C-\\><C-n>', -- jk in terminal mode
          },
        },
      },
    }
    
    -- Add a user command to check the plugin status
    vim.api.nvim_create_user_command('BetterEscapeStatus', function()
      print('Better Escape mappings active:')
      print('  jk -> Escape (insert/command mode)')  
      print('  kj -> Escape (insert/command mode)')
      print('  Timeout: 200ms')
    end, { desc = 'Show Better Escape plugin status' })
  end,
}