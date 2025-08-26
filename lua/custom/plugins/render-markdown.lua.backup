return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- mini.nvim for icons
  ft = { 'markdown' }, -- Only load for markdown files
  opts = {
    -- Configure the plugin here
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
      sign = true,
      position = 'overlay',
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      signs = { '󰫎 ' },
      width = 'full',
      backgrounds = {
        'RenderMarkdownH1Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH3Bg',
        'RenderMarkdownH4Bg',
        'RenderMarkdownH5Bg',
        'RenderMarkdownH6Bg',
      },
      foregrounds = {
        'RenderMarkdownH1',
        'RenderMarkdownH2',
        'RenderMarkdownH3',
        'RenderMarkdownH4',
        'RenderMarkdownH5',
        'RenderMarkdownH6',
      },
    },
    paragraph = {
      enabled = true,
      left_margin = 0,
      min_width = 0,
    },
    code = {
      enabled = true,
      sign = true,
      style = 'full',
      position = 'left',
      width = 'full',
      highlight = 'RenderMarkdownCode',
      border = 'thin',
    },
    dash = {
      enabled = true,
      icon = '─',
      highlight = 'RenderMarkdownDash',
    },
    bullet = {
      enabled = true,
      icons = { '●', '○', '◆', '◇' },
      highlight = 'RenderMarkdownBullet',
    },
    checkbox = {
      enabled = true,
      unchecked = {
        icon = '󰄱 ',
        highlight = 'RenderMarkdownUnchecked',
      },
      checked = {
        icon = '󰱒 ',
        highlight = 'RenderMarkdownChecked',
      },
      custom = {
        todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
      },
    },
    quote = {
      enabled = true,
      icon = '▋',
      highlight = 'RenderMarkdownQuote',
    },
    pipe_table = {
      enabled = true,
      style = 'full',
      cell = 'padded',
      alignment_indicator = '━',
      border = {
        '┌', '┬', '┐',
        '├', '┼', '┤',
        '└', '┴', '┘',
        '│', '─',
      },
      head = 'RenderMarkdownTableHead',
      row = 'RenderMarkdownTableRow',
      filler = 'RenderMarkdownTableFill',
    },
    callout = {
      note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
      tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
      important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
      warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
      caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
      abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
      todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
    },
    link = {
      enabled = true,
      image = '󰥶 ',
      email = '󰀓 ',
      hyperlink = '󰌹 ',
      highlight = 'RenderMarkdownLink',
      custom = {
        web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
      },
    },
    sign = {
      enabled = true,
      highlight = 'RenderMarkdownSign',
    },
    latex = {
      enabled = true,
      converter = 'latex2text',
      highlight = 'RenderMarkdownMath',
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