# Neovim Plugin Inventory

## 🎨 **UI & Interface**

### Core UI
- **`mellow-theme/mellow.nvim`** - Color theme with terminal transparency support
- **`folke/which-key.nvim`** - Keybinding hints and documentation
- **`nvim-tree/nvim-web-devicons`** - File type icons (if Nerd Font available)

### Dashboard & Status
- **`custom/plugins/alpha.lua`** - Neovim greeter with custom ASCII art and quick access
- **`custom/plugins/lualine.lua`** - Custom statusline with theme integration

### Visual Enhancements  
- **`lewis6991/indent_line.lua`** - Indentation guides
- **`custom/plugins/render-markdown.lua`** - Rich Markdown rendering with `<leader>mp` toggle

## 🔍 **Search & Navigation**

### Fuzzy Finding
- **`nvim-telescope/telescope.nvim`** - Fuzzy finder for files, buffers, grep, LSP
- **`nvim-telescope/telescope-fzf-native.nvim`** - Native FZF sorting for performance
- **`nvim-telescope/telescope-ui-select.nvim`** - Replace vim.ui.select with Telescope

### File Management
- **`kickstart/plugins/neo-tree.lua`** - File explorer sidebar
- **`custom/plugins/yazi.lua`** - Yazi file manager integration (`<leader>y`)

### Window & Pane Navigation
- **`custom/plugins/vim-tmux-navigator.lua`** - Seamless Neovim/tmux pane navigation (`<C-h/j/k/l>`)
- **`custom/plugins/vim-maximizer.lua`** - Toggle maximize/minimize splits (`<leader>sm`)

## ⚡ **Editing & Text Manipulation**

### Smart Editing
- **`tpope/vim-sleuth`** - Auto-detect tabstop and shiftwidth
- **`kickstart/plugins/autopairs.lua`** - Auto-close brackets, quotes, etc.
- **`custom/plugins/substitute.lua`** - Enhanced text substitution (`s`, `ss`, `S`)

### Input Enhancement
- **`custom/plugins/better-escape.lua`** - Lag-free escape mappings (`jj`, `jk`, `kj`)

### Completion System
- **`hrsh7th/nvim-cmp`** - Autocompletion engine
- **`L3MON4D3/LuaSnip`** - Snippet engine
- **`hrsh7th/cmp-nvim-lsp`** - LSP completion source
- **`hrsh7th/cmp-path`** - Path completion
- **`saadparwaiz1/cmp_luasnip`** - Snippet completion

## 🛠️ **Development Tools**

### Language Server Protocol (LSP)
- **`neovim/nvim-lspconfig`** - LSP client configurations
- **`williamboman/mason.nvim`** - Manage LSP servers, linters, formatters
- **`williamboman/mason-lspconfig.nvim`** - Mason + LSP integration  
- **`WhoIsSethDaniel/mason-tool-installer.nvim`** - Auto-install tools
- **`j-hui/fidget.nvim`** - LSP progress notifications
- **`hrsh7th/cmp-nvim-lsp`** - LSP completion capabilities

### Code Quality
- **`mfussenegger/nvim-lint`** - Async linting (JSON, Python, JS/TS, Markdown)
- **`stevearc/conform.nvim`** - Code formatting with format-on-save

### AI Assistance
- **`github/copilot.vim`** - GitHub Copilot integration

### Debugging
- **`kickstart/plugins/debug.lua`** - Debug adapter protocol setup

## 📝 **Git Integration**

### Git Operations
- **`lewis6991/gitsigns.nvim`** - Git signs in gutter, hunk operations
- **`custom/plugins/lazygit.lua`** - LazyGit integration (`<leader>lg`)
- **`axkirillov/unified.nvim`** - Inline git diff viewer (`<leader>gu`)

## 🔧 **Session & Workflow**

### Session Management
- **`custom/plugins/auto-session.lua`** - Automatic session management (`<leader>wr/ws`)

### Syntax & Parsing
- **`nvim-treesitter/nvim-treesitter`** - Syntax highlighting and parsing

### Lua Development
- **`folke/lazydev.nvim`** - Enhanced Lua development for Neovim
- **`Bilal2453/luvit-meta`** - Type definitions for Lua

### Core Infrastructure
- **`folke/lazy.nvim`** - Plugin manager with lazy loading
- **`nvim-lua/plenary.nvim`** - Lua utility functions (Telescope dependency)

## 📊 **Configured Tools (via Mason)**

### Formatters
- `stylua`, `prettier`, `prettierd`, `black`, `isort`

### Linters  
- `jsonlint`, `pylint`, `eslint_d`, `markdownlint`

### LSP Servers
- `lua_ls` (Lua Language Server)

---

## ⚠️ **Performance Analysis & Recommendations**

### 🚀 **Well-Optimized (Keep These)**
- **Lazy Loading**: Most plugins use proper `event`, `keys`, `cmd` triggers
- **Telescope**: Essential and well-configured with native FZF
- **LSP Stack**: Core development functionality
- **Conform.nvim**: Efficient formatting with `BufWritePre` trigger

### 🔥 **Potential Speed Degraders**

#### **High Impact**
- **`alpha.nvim`** - Dashboard loads on startup, delays first file access
  - *Solution*: Consider removing or add `lazy = false` only if needed
- **`auto-session.nvim`** - Session restoration can be slow with many files
  - *Solution*: Use manual session loading (`<leader>wr`) instead of auto
- **`render-markdown.nvim`** - Heavy processing for Markdown files
  - *Solution*: Already optimized with toggle (`<leader>mp`)

#### **Medium Impact**  
- **`nvim-treesitter`** - Large memory footprint
  - *Current*: Limited to essential languages ✅
- **`gitsigns.nvim`** - Runs on every buffer
  - *Current*: Well-optimized, keep as-is ✅

#### **Low Impact**
- **`better-escape.nvim`** - Minimal overhead, good lazy config ✅
- **`vim-tmux-navigator`** - Only loads on key press ✅

### 🗑️ **Consider Removing**

1. **`unified.nvim`** - Redundant with `gitsigns.nvim` hunk navigation
2. **`vim-maximizer`** - Native Neovim `<C-w>|` and `<C-w>_` work fine
3. **`substitute.nvim`** - Native `s` command sufficient for most use cases

### ⚡ **Performance Optimization Tips**

1. **Startup Profiling**: Use `:Lazy profile` to identify slow plugins
2. **Conditional Loading**: Many plugins already use proper lazy loading
3. **Memory Monitoring**: Use `:checkhealth lazy` for plugin status
4. **Session Size**: Keep auto-session directories small or disable auto-restore

### 🎯 **Recommendation Priority**

**Remove First** (Biggest Speed Gain):
1. `alpha.nvim` - Dashboard startup delay
2. `auto-session.nvim` auto-restore - Use manual session loading
3. `unified.nvim` - Functionality overlap with gitsigns

**Keep Everything Else** - Your configuration is well-optimized with proper lazy loading!