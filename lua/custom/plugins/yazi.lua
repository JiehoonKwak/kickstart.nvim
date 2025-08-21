return {
  'mikavilpas/yazi.nvim',
  version = '*',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  keys = {
    {
      '<leader>y',
      mode = { 'n', 'v' },
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      '<leader>cw',
      '<cmd>Yazi cwd<cr>',
      desc = 'Open yazi at the current working directory',
    },
  },
  opts = {
    -- Replace netrw when opening directories
    open_for_directories = false,
    
    -- Enable these keymaps
    keymaps = {
      show_help = '<f1>',
      open_file_in_vertical_split = '<c-v>',
      open_file_in_horizontal_split = '<c-x>',
      open_file_in_tab = '<c-t>',
      grep_in_directory = '<c-s>',
      replace_in_directory = '<c-g>',
      cycle_open_buffers = '<tab>',
      copy_relative_path_to_selected_files = '<c-y>',
      send_to_quickfix_list = '<c-q>',
    },
    
    -- Change Neovim's working directory when yazi's directory changes
    change_neovim_cwd_on_close = true,
    
    -- Floating window scaling factor (0.0 to 1.0)
    floating_window_scaling_factor = 0.9,
    
    -- Log level for debugging
    log_level = vim.log.levels.OFF,
  },
}