return {
  'max397574/better-escape.nvim',
  event = 'InsertEnter', -- Only load when entering insert mode
  config = function()
    require('better_escape').setup {
      timeout = 200, -- Time between key presses in milliseconds
      default_mappings = true,
      -- Disable in specific filetypes that have their own escape handling
      disabled_filetypes = { 'TelescopePrompt', 'yazi', 'alpha', 'lazy' },
      -- Disable completely in floating windows
      disabled_patterns = { 'telescope', 'yazi' },
      mappings = {
        i = { -- Insert mode mappings only (remove command mode to fix conflicts)
          j = {
            k = '<Esc>', -- jk -> Escape
            j = '<Esc>', -- jj -> Escape
          },
          k = {
            j = '<Esc>', -- kj -> Escape (alternative)
          },
        },
        -- Remove command mode mappings to prevent telescope conflicts
        t = { -- Terminal mode mappings
          j = {
            k = '<C-\\><C-n>', -- jk in terminal mode
            j = '<C-\\><C-n>', -- jj in terminal mode
          },
        },
      },
    }
    
    -- Additional autocmmd to completely disable better-escape in Telescope
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'TelescopePrompt' },
      callback = function()
        -- Temporarily disable better-escape mappings for this buffer
        vim.b.better_escape_disabled = true
      end,
    })
    
    -- Add a user command to check the plugin status
    vim.api.nvim_create_user_command('BetterEscapeStatus', function()
      print('Better Escape mappings active:')
      print('  jj -> Escape (insert/command mode)')
      print('  jk -> Escape (insert/command mode)')  
      print('  kj -> Escape (insert/command mode)')
      print('  Timeout: 200ms')
    end, { desc = 'Show Better Escape plugin status' })
  end,
}