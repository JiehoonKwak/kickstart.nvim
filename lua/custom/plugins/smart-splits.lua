return {
  'mrjones2014/smart-splits.nvim',
  lazy = false,
  config = function()
    require('smart-splits').setup({
      -- Zellij is auto-detected, but you can force it:
      -- multiplexer_integration = 'zellij',
    })

    -- Navigation between neovim splits AND zellij panes
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = 'Move to left split/pane' })
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = 'Move to bottom split/pane' })
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = 'Move to top split/pane' })
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = 'Move to right split/pane' })

    -- Resize splits (optional but useful)
    vim.keymap.set('n', '<A-H>', require('smart-splits').resize_left, { desc = 'Resize split left' })
    vim.keymap.set('n', '<A-J>', require('smart-splits').resize_down, { desc = 'Resize split down' })
    vim.keymap.set('n', '<A-K>', require('smart-splits').resize_up, { desc = 'Resize split up' })
    vim.keymap.set('n', '<A-L>', require('smart-splits').resize_right, { desc = 'Resize split right' })

    -- Swap buffers between splits
    vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left, { desc = 'Swap buffer left' })
    vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down, { desc = 'Swap buffer down' })
    vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up, { desc = 'Swap buffer up' })
    vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right, { desc = 'Swap buffer right' })
  end,
}
