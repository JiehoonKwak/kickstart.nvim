return {
  'rmagatti/auto-session',
  dependencies = {
    'nvim-telescope/telescope.nvim', -- For session picker
  },
  config = function()
    local auto_session = require('auto-session')

    auto_session.setup({
      auto_restore_enabled = true,        -- Auto restore when opening nvim in a project dir
      auto_save_enabled = true,           -- Auto save on exit
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
      session_lens = {
        load_on_setup = true,             -- Enable Telescope integration
        theme_conf = { border = true },
        previewer = false,
      },
      -- Re-apply fold settings after session restore (sessions save old foldmethod)
      post_restore_cmds = {
        function()
          vim.opt.foldmethod = 'expr'
          vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.opt.foldlevel = 99
          vim.opt.foldenable = true
        end,
      },
    })

    local keymap = vim.keymap

    -- Session management keymaps
    keymap.set('n', '<leader>wp', '<cmd>Autosession search<CR>', { desc = '[W]orkspace [P]icker (switch project)' })
    keymap.set('n', '<leader>ws', '<cmd>Autosession save<CR>', { desc = '[W]orkspace [S]ave' })
    keymap.set('n', '<leader>wr', '<cmd>Autosession restore<CR>', { desc = '[W]orkspace [R]estore last' })
    keymap.set('n', '<leader>wd', '<cmd>Autosession delete<CR>', { desc = '[W]orkspace [D]elete' })
  end,
}