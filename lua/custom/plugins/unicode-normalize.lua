-- Unicode NFD→NFC Normalization for Korean text
-- macOS uses NFD which breaks Hangul rendering in Neovim
-- This plugin automatically normalizes content to NFC on file read/write

return {
  'unicode-normalize', -- virtual plugin name
  dir = vim.fn.stdpath('config') .. '/lua/custom/plugins', -- local plugin
  lazy = false,
  config = function()
    -- Check if buffer contains NFD Korean characters
    -- NFD Hangul uses Jamo characters in the range U+1100-U+11FF
    local function has_nfd_korean(content)
      -- Match NFD Hangul Jamo: U+1100-U+11FF
      return content:find('[\225\132\128-\225\135\191]') ~= nil
    end

    -- Normalize buffer content from NFD to NFC using Python
    local function normalize_buffer()
      local bufnr = vim.api.nvim_get_current_buf()
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      local content = table.concat(lines, '\n')

      -- Skip if no NFD Korean characters detected
      if not has_nfd_korean(content) then
        return
      end

      -- Use Python to normalize NFD→NFC
      local python_script = [[
import sys
import unicodedata
content = sys.stdin.read()
normalized = unicodedata.normalize('NFC', content)
sys.stdout.write(normalized)
]]

      local result = vim.fn.system({ 'python3', '-c', python_script }, content)

      if vim.v.shell_error ~= 0 then
        vim.notify('Unicode normalization failed', vim.log.levels.WARN)
        return
      end

      -- Split result back into lines
      local normalized_lines = vim.split(result, '\n', { plain = true })

      -- Check if content actually changed
      local changed = false
      if #normalized_lines ~= #lines then
        changed = true
      else
        for i, line in ipairs(normalized_lines) do
          if line ~= lines[i] then
            changed = true
            break
          end
        end
      end

      if changed then
        -- Preserve cursor position
        local cursor = vim.api.nvim_win_get_cursor(0)

        -- Update buffer without triggering autocmds (prevent loops)
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, normalized_lines)

        -- Restore cursor (clamp to valid position)
        local new_line_count = vim.api.nvim_buf_line_count(bufnr)
        cursor[1] = math.min(cursor[1], new_line_count)
        local line_length = #(vim.api.nvim_buf_get_lines(bufnr, cursor[1] - 1, cursor[1], false)[1] or '')
        cursor[2] = math.min(cursor[2], line_length)
        pcall(vim.api.nvim_win_set_cursor, 0, cursor)

        vim.notify('Normalized NFD→NFC Korean text', vim.log.levels.INFO)
      end
    end

    -- Create autocommand group
    local augroup = vim.api.nvim_create_augroup('UnicodeNormalize', { clear = true })

    -- Normalize on file read (for Markdown files in Obsidian vault)
    vim.api.nvim_create_autocmd('BufReadPost', {
      group = augroup,
      pattern = { '*.md', '*.txt' },
      callback = function()
        -- Defer to ensure buffer is fully loaded
        vim.defer_fn(normalize_buffer, 10)
      end,
      desc = 'Normalize NFD to NFC for Korean text',
    })

    -- Optional: Normalize before saving to ensure files are stored in NFC
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      pattern = { '*.md', '*.txt' },
      callback = normalize_buffer,
      desc = 'Ensure NFC normalization before save',
    })

    -- Command to manually trigger normalization
    vim.api.nvim_create_user_command('NormalizeUnicode', function()
      normalize_buffer()
    end, { desc = 'Normalize buffer content from NFD to NFC' })

    -- Command to check if buffer has NFD content
    vim.api.nvim_create_user_command('CheckNFD', function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local content = table.concat(lines, '\n')
      if has_nfd_korean(content) then
        vim.notify('Buffer contains NFD Korean characters', vim.log.levels.WARN)
      else
        vim.notify('Buffer is NFC normalized', vim.log.levels.INFO)
      end
    end, { desc = 'Check if buffer contains NFD Korean characters' })
  end,
}
