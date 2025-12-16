-- External app integrations (similar to Yazi's o* shortcuts)
-- Prefix: <leader>o (open with)

return {
  -- No external plugins needed, just keymaps
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      table.insert(opts.spec, { '<leader>o', group = '[O]pen with' })
    end,
  },
  {
    dir = vim.fn.stdpath 'config',
    name = 'external-apps',
    config = function()
      local map = vim.keymap.set

      -- Open current file in VS Code
      map('n', '<leader>oc', function()
        vim.fn.system('code "' .. vim.fn.expand '%:p' .. '"')
      end, { desc = 'Open in VS Code' })

      -- Open current file in Finder (reveal)
      map('n', '<leader>or', function()
        vim.fn.system('open -R "' .. vim.fn.expand '%:p' .. '"')
      end, { desc = 'Reveal in Finder' })

      -- Open markdown in Obsidian
      map('n', '<leader>oo', function()
        local file = vim.fn.expand '%:t:r' -- filename without extension
        vim.fn.system('open "obsidian://open?vault=Database&file=' .. file .. '"')
      end, { desc = 'Open in Obsidian' })

      -- Open with default app
      map('n', '<leader>od', function()
        vim.fn.system('open "' .. vim.fn.expand '%:p' .. '"')
      end, { desc = 'Open with default app' })

      -- Open terminal at current file's directory
      map('n', '<leader>ot', function()
        vim.fn.system('open -a Ghostty "' .. vim.fn.expand '%:p:h' .. '"')
      end, { desc = 'Open Ghostty here' })

      -- Copy file path to clipboard
      map('n', '<leader>op', function()
        local path = vim.fn.expand '%:p'
        vim.fn.setreg('+', path)
        print('Copied: ' .. path)
      end, { desc = 'Copy file path' })
    end,
  },
}
