return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<C-`>', '<cmd>ToggleTerm<cr>', desc = 'Toggle terminal' },
    { '<leader>tt', '<cmd>ToggleTerm direction=float<cr>', desc = 'Float terminal' },
    { '<leader>t-', '<cmd>ToggleTerm direction=horizontal size=15<cr>', desc = 'Horizontal terminal' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=80<cr>', desc = 'Vertical terminal' },
  },
  opts = {
    open_mapping = [[<C-`>]],
    direction = 'float',
    float_opts = { border = 'curved' },
    shade_terminals = false,
  },
}
