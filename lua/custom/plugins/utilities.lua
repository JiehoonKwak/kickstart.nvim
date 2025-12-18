-- Custom utility keymaps (yank paths + external apps)
-- Prefixes: <leader>y (yank), <leader>o (open with)

return {
  {
    dir = vim.fn.stdpath 'config',
    name = 'utilities',
    event = 'VeryLazy',
    config = function()
      local map = vim.keymap.set

      -- Helper for yank operations
      local function yank_and_notify(value, label)
        vim.fn.setreg('+', value)
        vim.notify('Copied ' .. label .. ': ' .. value, vim.log.levels.INFO)
      end

      -- ═══════════════════════════════════════════════════════════════
      -- Yank path utilities (<leader>y)
      -- ═══════════════════════════════════════════════════════════════

      map('n', '<leader>yp', function()
        yank_and_notify(vim.fn.expand '%:p', 'absolute path')
      end, { desc = 'Yank absolute path' })

      map('n', '<leader>yr', function()
        yank_and_notify(vim.fn.expand '%:.', 'relative path')
      end, { desc = 'Yank relative path' })

      map('n', '<leader>yf', function()
        yank_and_notify(vim.fn.expand '%:t', 'filename')
      end, { desc = 'Yank filename' })

      map('n', '<leader>yn', function()
        yank_and_notify(vim.fn.expand '%:t:r', 'name')
      end, { desc = 'Yank name (no ext)' })

      map('n', '<leader>yd', function()
        yank_and_notify(vim.fn.expand '%:p:h', 'directory')
      end, { desc = 'Yank directory path' })

      -- ═══════════════════════════════════════════════════════════════
      -- External app integrations (<leader>o)
      -- ═══════════════════════════════════════════════════════════════

      map('n', '<leader>oc', function()
        vim.fn.system('code "' .. vim.fn.expand '%:p' .. '"')
      end, { desc = 'Open in VS Code' })

      map('n', '<leader>or', function()
        vim.fn.system('open -R "' .. vim.fn.expand '%:p' .. '"')
      end, { desc = 'Reveal in Finder' })

      map('n', '<leader>oo', function()
        local file = vim.fn.expand '%:t:r'
        vim.fn.system('open "obsidian://open?vault=Database&file=' .. file .. '"')
      end, { desc = 'Open in Obsidian' })

      map('n', '<leader>od', function()
        vim.fn.system('open "' .. vim.fn.expand '%:p' .. '"')
      end, { desc = 'Open with default app' })

      map('n', '<leader>ot', function()
        vim.fn.system('open -a Ghostty "' .. vim.fn.expand '%:p:h' .. '"')
      end, { desc = 'Open Ghostty here' })

      map('n', '<leader>oa', function()
        local antigravity = vim.fn.expand '$HOME/.antigravity/antigravity/bin/antigravity'
        vim.fn.system(antigravity .. ' "' .. vim.fn.expand '%:p' .. '"')
      end, { desc = 'Open in Antigravity' })
    end,
  },
}
