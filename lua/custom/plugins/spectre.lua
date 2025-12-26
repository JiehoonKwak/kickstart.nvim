-- nvim-spectre: VS Code-style search and replace panel
-- Keybindings use <leader>r prefix (r = replace)

return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>rr', function() require('spectre').open() end, desc = 'Search & Replace (project)' },
    { '<leader>rw', function() require('spectre').open_visual({ select_word = true }) end, desc = 'Replace word under cursor' },
    { '<leader>rw', function() require('spectre').open_visual() end, mode = 'v', desc = 'Replace selection' },
    { '<leader>rf', function() require('spectre').open_file_search() end, desc = 'Replace in current file' },
  },
  opts = {
    highlight = {
      ui = 'String',
      search = 'DiffDelete',
      replace = 'DiffAdd',
    },
    mapping = {
      -- Inside spectre panel
      ['toggle_line'] = { map = 'dd', cmd = "<cmd>lua require('spectre').toggle_line()<CR>", desc = 'toggle item' },
      ['enter_file'] = { map = '<cr>', cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>", desc = 'open file' },
      ['send_to_qf'] = { map = '<leader>q', cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>", desc = 'send to quickfix' },
      ['replace_cmd'] = { map = '<leader>c', cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>", desc = 'input replace command' },
      ['show_option_menu'] = { map = '<leader>o', cmd = "<cmd>lua require('spectre').show_options()<CR>", desc = 'show options' },
      ['run_current_replace'] = { map = '<leader>rc', cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>", desc = 'replace current line' },
      ['run_replace'] = { map = '<leader>R', cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>", desc = 'replace all' },
      ['change_view_mode'] = { map = '<leader>v', cmd = "<cmd>lua require('spectre').change_view()<CR>", desc = 'change view mode' },
      ['toggle_live_update'] = { map = 'tu', cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>", desc = 'toggle live update' },
      ['toggle_ignore_case'] = { map = 'ti', cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>", desc = 'toggle ignore case' },
      ['toggle_ignore_hidden'] = { map = 'th', cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>", desc = 'toggle hidden' },
      ['resume_last_search'] = { map = '<leader>l', cmd = "<cmd>lua require('spectre').resume_last_search()<CR>", desc = 'resume last search' },
    },
  },
}
