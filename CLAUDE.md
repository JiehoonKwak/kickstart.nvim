# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration based on kickstart.nvim with a two-layer architecture:
- **Base layer** (`lua/kickstart/`): Core functionality and sensible defaults
- **Custom layer** (`lua/custom/`): User-specific overrides and extensions

## Architecture

### Key Entry Points
- `init.lua`: Main configuration entry point
- `lua/custom/init.lua`: User customization entry point  
- `lua/custom/plugins/init.lua`: Custom plugin definitions
- `lazy-plugins.lua`: Plugin bootstrap and lazy.nvim setup

### Plugin Management
- Uses **lazy.nvim** for plugin management with lazy loading
- Plugin versions locked in `lazy-lock.json` for reproducibility
- Plugins configured in individual files under `lua/kickstart/plugins/` and `lua/custom/plugins/`

### Configuration Patterns
- One file per major plugin (e.g., `lsp.lua`, `neo-tree.lua`, `gitsigns.lua`)
- Custom configurations extend or override kickstart defaults
- Keybindings extensively use which-key for discoverability

## Common Development Tasks

### Testing Configuration Changes
```bash
# Check health of configuration
nvim --headless -c "checkhealth kickstart" -c "quit"

# Test configuration in clean environment
nvim --clean -u init.lua
```

### Plugin Management
```bash
# Update plugins (run inside Neovim)
:Lazy update

# Check plugin status
:Lazy

# Clean unused plugins
:Lazy clean
```

### Adding New Plugins
- Add plugin specifications to `lua/custom/plugins/init.lua` or create individual files in `lua/custom/plugins/`
- Follow existing patterns in `lua/kickstart/plugins/` for configuration structure
- Use lazy loading specifications for performance
- Example: `render-markdown.lua` provides rich Markdown rendering with `<leader>mp` toggle

### Escape Key Behavior
- **Telescope**: Single `<Esc>` closes search interface (configured in `init.lua`)
- **Yazi**: Both `q` and `<Esc>` exit file manager
- **Insert Mode**: `jj`, `jk`, `kj` escape sequences work via better-escape plugin
- **Better-escape**: Automatically disabled in Telescope and yazi to prevent conflicts

### Health Diagnostics
- Run `:checkhealth kickstart` in Neovim for configuration validation
- Health check implementation in `lua/kickstart/health.lua`

## File Organization

### Kickstart Base Layer
- `lua/kickstart/plugins/`: Core plugin configurations
- `lua/kickstart/health.lua`: Health check utilities
- Individual plugin files for major functionality (LSP, debugging, file explorer, etc.)

### Custom Layer
- `lua/custom/init.lua`: Main customization file
- `lua/custom/plugins/`: Custom plugin configurations
- `lua/custom/plugins/init.lua`: Plugin specification table
- `lua/custom/plugins/render-markdown.lua`: Rich Markdown rendering plugin

### Root Level
- `init.lua`: Loads lazy.nvim and plugin specifications
- `lazy-lock.json`: Version lock file (commit this file for reproducible setups)
- `lazy-plugins.lua`: Plugin loader and lazy.nvim bootstrap

## Customization Guidelines

### Adding Custom Configuration
1. Extend `lua/custom/init.lua` for general settings
2. Add plugin configs to `lua/custom/plugins/` following kickstart patterns
3. Override default keybindings in custom layer

### Plugin Configuration Pattern
```lua
return {
  'plugin/name',
  dependencies = { 'dependency/plugin' },
  config = function()
    -- Plugin setup here
  end,
  -- Lazy loading specs
  event = 'VeryLazy',
  keys = { '<leader>x' },
}
```

### Avoiding Conflicts
- Custom configurations take precedence over kickstart defaults
- Use `vim.tbl_deep_extend` for merging tables when extending configurations
- Check existing keybindings with `:map` before adding new ones

## Important Notes

- Configuration changes require Neovim restart or `:source %` for most settings
- LSP configurations are complex - modify carefully in `lua/kickstart/plugins/lsp.lua`
- Plugin dependencies are automatically managed by lazy.nvim
- The `lazy-lock.json` file should be committed to maintain consistent plugin versions
- Use `:Lazy profile` to debug slow startup times

## Custom Plugins Installed

### alpha.nvim
- **Purpose**: Neovim greeter/dashboard with custom ASCII art
- **Location**: `lua/custom/plugins/alpha.lua`
- **Features**: NEOVIM ASCII header, quick file/session access buttons
- **Keybindings**: Space-based shortcuts matching Telescope commands

### auto-session.nvim
- **Purpose**: Automatic session management
- **Location**: `lua/custom/plugins/auto-session.lua`
- **Key Shortcuts**:
  - `<leader>wr` - Restore session for current directory
  - `<leader>ws` - Save session for current directory
- **Features**: Auto session suppression for common directories, manual restore mode

### better-escape.nvim
- **Purpose**: Lag-free escape key mappings with smart timing detection
- **Location**: `lua/custom/plugins/better-escape.lua`
- **Escape Mappings**:
  - `jj` - Escape to normal mode (primary choice)
  - `jk` - Escape to normal mode (backup)
  - `kj` - Escape to normal mode (alternative)
- **Features**: 200ms timeout, works in insert/terminal modes, eliminates typing lag
- **Disabled**: Automatically disabled in Telescope, yazi, alpha, and lazy interfaces for proper escape behavior
- **Module**: Uses `require('better_escape')` with underscore (not hyphen)
- **Command**: `:BetterEscapeStatus` - Show current mappings and settings

### GitHub Copilot
- **Purpose**: AI code completion and assistance
- **Location**: `lua/custom/plugins/init.lua`
- **Features**: GitHub Copilot integration, loads on InsertEnter event
- **Plugin**: `github/copilot.vim`

### lazygit.nvim
- **Purpose**: Lazygit integration within Neovim
- **Location**: `lua/custom/plugins/lazygit.lua`
- **Key Shortcuts**:
  - `<leader>lg` - Open LazyGit interface
- **Commands**: LazyGit, LazyGitConfig, LazyGitCurrentFile, LazyGitFilter, LazyGitFilterCurrentFile

### lualine.nvim
- **Purpose**: Customizable statusline with theme integration
- **Location**: `lua/custom/plugins/lualine.lua`
- **Features**: Custom color theme, lazy.nvim update notifications, file info display
- **Theme**: Custom blue/green/violet/yellow color scheme

### render-markdown.nvim
- **Purpose**: Rich Markdown rendering with enhanced visual elements
- **Location**: `lua/custom/plugins/render-markdown.lua`
- **Key Shortcuts**:
  - `<leader>mp` - Toggle Markdown Preview
  - `<leader>me` - Enable Markdown Rendering
  - `<leader>md` - Disable Markdown Rendering
  - `<leader>mc` - Show Markdown Config
- **Features**: Headings with icons, code blocks, tables, checkboxes, callouts, anti-conceal
- **Auto-enabled**: Automatically activates for `.md` files

### flash.nvim
- **Purpose**: Fast motion/jump plugin for navigating anywhere on screen
- **Location**: `lua/custom/plugins/flash.lua`
- **Key Shortcuts**:
  - `s` - Flash jump (type chars to jump to any match)
  - `S` - Flash treesitter (select treesitter nodes)
- **Usage**: Press `s`, type 1-2 chars, then press the label to jump

### unified.nvim
- **Purpose**: Inline git diff viewer with navigation
- **Location**: `lua/custom/plugins/init.lua`
- **Key Shortcuts**:
  - `<leader>gu` - Git unified diff view
  - `<leader>gr` - Reset unified view
  - `]h` - Next git hunk
  - `[h` - Previous git hunk
- **Features**: Inline diffs, file tree disabled, custom gutter signs

### vim-maximizer
- **Purpose**: Split window maximization/minimization
- **Location**: `lua/custom/plugins/vim-maximizer.lua`
- **Key Shortcuts**:
  - `<leader>sm` - Toggle maximize/minimize split

### vim-tmux-navigator
- **Purpose**: Seamless navigation between Neovim and tmux panes
- **Location**: `lua/custom/plugins/vim-tmux-navigator.lua`
- **Key Shortcuts**:
  - `<C-h>` - Navigate left
  - `<C-j>` - Navigate down
  - `<C-k>` - Navigate up
  - `<C-l>` - Navigate right
  - `<C-\>` - Navigate to previous

### yazi.nvim
- **Purpose**: Yazi file manager integration
- **Location**: `lua/custom/plugins/yazi.lua`
- **Key Shortcuts**:
  - `<leader>y` - Open yazi file manager
- **Features**: Directory sync, floating window, various file operations, quickfix integration
- **Exit**: Use `q` or `<Esc>` to quit yazi
