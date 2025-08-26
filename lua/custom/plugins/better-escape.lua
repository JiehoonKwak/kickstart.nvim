return {
  'max397574/better-escape.nvim',
  event = 'InsertEnter', -- Only load when entering insert mode
  config = function()
    require('better_escape').setup {
      timeout = 100, -- Reduced timeout - must type faster (100ms)
      default_mappings = false, -- Disable default mappings, use custom only
      -- Disable in specific filetypes that have their own escape handling
      disabled_filetypes = { 'TelescopePrompt', 'yazi', 'alpha', 'lazy' },
      -- Disable completely in floating windows
      disabled_patterns = { 'telescope', 'yazi' },
      mappings = {
        i = { -- Insert mode mappings only
          j = {
            k = '<Esc>', -- jk -> Escape
            -- Removed jj mapping
          },
          k = {
            j = '<Esc>', -- kj -> Escape
          },
        },
        t = { -- Terminal mode mappings
          j = {
            k = '<C-\\><C-n>', -- jk in terminal mode
            -- Removed jj mapping
          },
          k = {
            j = '<C-\\><C-n>', -- kj in terminal mode
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
      print('  jk -> Escape (insert/terminal mode)')  
      print('  kj -> Escape (insert/terminal mode)')
      print('  Timeout: 100ms (fast typing required)')
    end, { desc = 'Show Better Escape plugin status' })
  end,
}