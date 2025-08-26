return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- mini.nvim for icons
  ft = { 'markdown' }, -- Only load for markdown files
  opts = {
    -- GitHub-style minimal configuration
    enabled = true,
    max_file_size = 5.0, -- MB
    debounce = 100,
    render_modes = { 'n', 'c', 't' },
    anti_conceal = {
      enabled = true,
      -- Keep cursor line visible
      ignore_code_background = true,
    },
    heading = {
      enabled = true,
      sign = false, -- Disable sign column icons
      position = 'inline',
      icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' }, -- Simple text markers
      signs = {},
      width = 'block', -- GitHub-like width
      backgrounds = {}, -- No background highlights
      foregrounds = {
        'Normal', 'Normal', 'Normal', 'Normal', 'Normal', 'Normal'
      },
      border = false, -- No decorative borders
    },
    paragraph = {
      enabled = true,
      left_margin = 0,
      min_width = 0,
    },
    code = {
      enabled = true,
      sign = false,
      style = 'normal', -- Minimal code block style
      position = 'left',
      width = 'block',
      highlight = 'Normal', -- No special highlighting
      border = 'none', -- No borders
      above = '', -- No decorative chars above
      below = '', -- No decorative chars below
      disable_background = true, -- No code block backgrounds
    },
    dash = {
      enabled = true,
      icon = '─',
      highlight = 'Comment',
    },
    bullet = {
      enabled = true,
      icons = { '•', '◦', '▸', '▹' }, -- Simple bullets
      highlight = 'Normal',
    },
    checkbox = {
      enabled = true,
      unchecked = {
        icon = '☐ ', -- Simple checkbox
        highlight = 'Normal',
      },
      checked = {
        icon = '☑ ', -- Simple checked box
        highlight = 'Normal',
      },
      custom = {
        todo = { raw = '[-]', rendered = '◯ ', highlight = 'Comment' },
      },
    },
    quote = {
      enabled = true,
      icon = '│', -- Simple vertical line
      highlight = 'Comment',
    },
    pipe_table = {
      enabled = true,
      style = 'normal', -- Minimal table style
      cell = 'padded',
      alignment_indicator = '─',
      border = {
        '│', '─', '┌', '┐', '└', '┘', '├', '┤', '┬', '┴', '┼'
      },
      head = 'Normal',
      row = 'Normal',
      filler = 'Normal',
    },
    callout = {
      -- Simplified callouts without fancy icons
      note = { raw = '[!NOTE]', rendered = 'Note', highlight = 'Comment' },
      tip = { raw = '[!TIP]', rendered = 'Tip', highlight = 'Comment' },
      important = { raw = '[!IMPORTANT]', rendered = 'Important', highlight = 'Comment' },
      warning = { raw = '[!WARNING]', rendered = 'Warning', highlight = 'Comment' },
      caution = { raw = '[!CAUTION]', rendered = 'Caution', highlight = 'Comment' },
    },
    link = {
      enabled = true,
      image = '', -- No image icon
      email = '', -- No email icon
      hyperlink = '', -- No hyperlink icon
      highlight = 'Underlined',
      custom = {
        web = { pattern = '^http[s]?://', icon = '', highlight = 'Underlined' },
      },
    },
    sign = {
      enabled = false, -- Disable all sign column elements
    },
    latex = {
      enabled = true,
      converter = 'latex2text',
      highlight = 'Comment',
    },
  },
  keys = {
    -- Toggle markdown rendering
    { '<leader>mp', '<cmd>RenderMarkdown toggle<cr>', desc = 'Toggle Markdown Preview', ft = 'markdown' },
    
    -- Enable/disable commands
    { '<leader>me', '<cmd>RenderMarkdown enable<cr>', desc = 'Enable Markdown Rendering', ft = 'markdown' },
    { '<leader>md', '<cmd>RenderMarkdown disable<cr>', desc = 'Disable Markdown Rendering', ft = 'markdown' },
    
    -- Show config
    { '<leader>mc', '<cmd>RenderMarkdown config<cr>', desc = 'Show Markdown Config', ft = 'markdown' },
    
    -- Additional useful shortcuts
    { '<leader>ml', '<cmd>RenderMarkdown log<cr>', desc = 'Show Markdown Logs', ft = 'markdown' },
  },
  config = function(_, opts)
    require('render-markdown').setup(opts)
    
    -- Auto-enable for markdown files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.cmd('RenderMarkdown enable')
      end,
    })
  end,
}