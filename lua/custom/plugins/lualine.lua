return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lualine = require('lualine')

    -- Custom function to get current working directory
    local function get_cwd()
      return vim.fn.getcwd()
    end

    -- Minimal terminal-matching theme
    local colors = {
      fg = '#c3ccdc',      -- Light text
      bg = '#1e1e1e',      -- Dark background
      accent = '#5fafff',  -- Cyan accent matching terminal
      inactive = '#4a4a4a', -- Inactive/comment color
    }

    local minimal_theme = {
      normal = {
        a = { bg = colors.accent, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.inactive, fg = colors.fg },
        c = { bg = 'none', fg = colors.fg },
      },
      insert = {
        a = { bg = colors.accent, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.inactive, fg = colors.fg },
        c = { bg = 'none', fg = colors.fg },
      },
      visual = {
        a = { bg = colors.accent, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.inactive, fg = colors.fg },
        c = { bg = 'none', fg = colors.fg },
      },
      command = {
        a = { bg = colors.accent, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.inactive, fg = colors.fg },
        c = { bg = 'none', fg = colors.fg },
      },
      replace = {
        a = { bg = colors.accent, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.inactive, fg = colors.fg },
        c = { bg = 'none', fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive, fg = colors.fg },
        b = { bg = colors.inactive, fg = colors.fg },
        c = { bg = 'none', fg = colors.inactive },
      },
    }

    -- Configure lualine with minimal components
    lualine.setup({
      options = {
        theme = minimal_theme,
        component_separators = { left = '|', right = '|' },
        section_separators = '',
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { get_cwd, 'filename' },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}