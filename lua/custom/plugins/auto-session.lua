return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require('auto-session')

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
    })

    local keymap = vim.keymap

    keymap.set('n', '<leader>wr', '<cmd>Autosession search<CR>', { desc = 'Search sessions' })
    keymap.set('n', '<leader>ws', '<cmd>Autosession save<CR>', { desc = 'Save session' })
    keymap.set('n', '<leader>wl', '<cmd>Autosession restore<CR>', { desc = 'Restore last session' })
  end,
}