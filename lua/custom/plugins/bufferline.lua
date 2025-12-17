return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
    { '<leader>bx', '<cmd>bdelete<cr>', desc = 'Close current buffer' },
    { '<leader>bX', '<cmd>BufferLineCloseOthers<cr>', desc = 'Close other buffers' },
    { '<leader>bd', '<cmd>BufferLinePickClose<cr>', desc = 'Pick buffer to close' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Pin buffer' },
  },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      offsets = {
        { filetype = 'neo-tree', text = 'File Explorer', highlight = 'Directory' },
      },
    },
  },
}
