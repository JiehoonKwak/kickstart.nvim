return {
  'ellisonleao/glow.nvim',
  cmd = 'Glow',
  ft = 'markdown',
  keys = {
    { '<leader>mp', '<cmd>Glow<cr>', desc = 'Markdown Preview (glow)', ft = 'markdown' },
  },
  opts = {
    border = 'rounded',
    width = 100,
    height_ratio = 0.9,
    style = 'dark',
    pager = false,
  },
}
