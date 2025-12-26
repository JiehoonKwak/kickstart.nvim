# Neovim Cheatsheet (Leader = Space)

## Vim Essentials (Default Keys)

### Movement

| Key              | Action                      |
| ---------------- | --------------------------- |
| `h/j/k/l`        | ←↓↑→                        |
| `w` / `b`        | Next/prev word start        |
| `e`              | Word end                    |
| `0` / `$`        | Line start/end              |
| `^`              | First non-blank char        |
| `gg` / `G`       | File start/end              |
| `{` / `}`        | Paragraph up/down           |
| `%`              | Matching bracket            |
| `f` / `t` + char | Find/till char on line      |
| `F` / `T` + char | Find/till backward          |
| `;` / `,`        | Repeat f/t forward/backward |
| `*` / `#`        | Search word under cursor    |

### Operators (combine with motions)

| Key         | Action                   | Example          |
| ----------- | ------------------------ | ---------------- |
| `d`         | Delete                   | `dw` `d$` `diw`  |
| `c`         | Change (delete + insert) | `cw` `ci"` `ct:` |
| `y`         | Yank (copy)              | `yw` `yy` `yi)`  |
| `v`         | Visual select            | `vw` `vi{` `vap` |
| `>` / `<`   | Indent/outdent           | `>>` `>ap`       |
| `gu` / `gU` | Lowercase/uppercase      | `guiw` `gUiw`    |

### Text Objects (use after operator)

| Key         | Meaning                    | Example                    |
| ----------- | -------------------------- | -------------------------- |
| `iw` / `aw` | Inner/around word          | `ciw` = change word        |
| `i"` / `a"` | Inner/around double quotes | `ci"` = change inside ""   |
| `i'` / `a'` | Inner/around single quotes | `di'` = delete inside ''   |
| `i)` / `a)` | Inner/around parens        | `yi)` = yank inside ()     |
| `i}` / `a}` | Inner/around braces        | `ci{` = change inside {}   |
| `i]` / `a]` | Inner/around brackets      | `di]` = delete inside []   |
| `it` / `at` | Inner/around HTML tag      | `cit` = change tag content |
| `ip` / `ap` | Inner/around paragraph     | `dap` = delete paragraph   |

### Quick Actions

| Key            | Action                        |
| -------------- | ----------------------------- |
| `x`            | Delete char                   |
| `r` + char     | Replace char                  |
| `~`            | Toggle case                   |
| `p` / `P`      | Paste after/before            |
| `u` / `Ctrl+r` | Undo/redo                     |
| `.`            | Repeat last change            |
| `J`            | Join lines                    |
| `o` / `O`      | New line below/above + insert |
| `A` / `I`      | Append end / Insert start     |
| `==`           | Auto-indent line              |
| `ZZ`           | Save and quit                 |

### Surround (mini.surround)

| Key                  | Action           | Example                        |
| -------------------- | ---------------- | ------------------------------ |
| `sa` + motion + char | Surround add     | `saiw"` = surround word with " |
| `sd` + char          | Surround delete  | `sd"` = delete surrounding "   |
| `sr` + old + new     | Surround replace | `sr"'` = replace " with '      |

### Essential Combos

```
ciw      # Change inner word (most used!)
ci"      # Change inside quotes
ct:      # Change till :
di)      # Delete inside parens
yap      # Yank around paragraph
vip      # Select paragraph
ggVG     # Select entire file
```

---

## File Explorer

| Key                | Action                           |
| ------------------ | -------------------------------- |
| `\`                | Toggle Neo-tree (sidebar)        |
| `<leader>e`        | Explore with Yazi (file manager) |
| `<leader>sf`       | Search files (Telescope)         |
| `<leader>sg`       | Search text in files (grep)      |
| `<leader>s.`       | Recent files                     |
| `<leader><leader>` | Find open buffers                |

### Creating Files/Folders

**In Neo-tree (`\`):**

- `a` - Create new file
- `A` - Create new folder
- `d` - Delete
- `r` - Rename
- `c` / `p` - Copy / Paste
- `m` - Move

**In Yazi (`<leader>e`):**

- `a` - Create file
- `Shift+A` - Create folder
- `d` - Delete (to trash)
- `r` - Rename
- `y` / `p` - Yank / Paste

## Buffers

| Key                   | Action                 |
| --------------------- | ---------------------- |
| `Shift+h` / `Shift+l` | Previous / Next buffer |
| `<leader>bp`          | Pin buffer             |
| `<leader>bx`          | Pick buffer to close   |
| `<leader>bo`          | Close other buffers    |

## Git

### In-buffer (gitsigns)

| Key          | Action                   |
| ------------ | ------------------------ |
| `]c` / `[c`  | Jump to next/prev change |
| `<leader>hp` | Preview hunk (see diff)  |
| `<leader>hs` | Stage hunk               |
| `<leader>hr` | Reset hunk               |
| `<leader>hS` | Stage entire buffer      |
| `<leader>hR` | Reset entire buffer      |
| `<leader>hb` | Blame current line       |
| `<leader>hd` | Diff against index       |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle line blame        |
| `<leader>tD` | Toggle show deleted      |

### Full Git UI

| Key          | Action                   |
| ------------ | ------------------------ |
| `<leader>lg` | Open LazyGit             |
| `<leader>gu` | Unified diff view        |
| `]h` / `[h`  | Navigate hunks (unified) |

## Code / LSP

| Key          | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gr`         | Find references      |
| `gI`         | Go to implementation |
| `gD`         | Go to declaration    |
| `K`          | Hover documentation  |
| `<leader>ca` | Code actions         |
| `<leader>rn` | Rename symbol        |
| `<leader>ds` | Document symbols     |
| `<leader>ws` | Workspace symbols    |
| `gy`         | Goto type definition |
| `<leader>f`  | Format buffer        |

## Navigation / Jump

| Key                 | Action                          |
| ------------------- | ------------------------------- |
| `s`                 | Flash jump (type chars to jump) |
| `S`                 | Flash treesitter select         |
| `<leader>u`         | Undo tree                       |
| `Ctrl+o` / `Ctrl+i` | Jump back / forward             |

## Terminal

| Key          | Action              |
| ------------ | ------------------- |
| `` Ctrl+` `` | Toggle terminal     |
| `<leader>tt` | Float terminal      |
| `<leader>t-` | Horizontal terminal |
| `<leader>tv` | Vertical terminal   |
| `Esc Esc`    | Exit terminal mode  |

## Diagnostics (Trouble)

| Key          | Action             |
| ------------ | ------------------ |
| `<leader>xx` | All diagnostics    |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xs` | Document symbols   |
| `<leader>xq` | Quickfix list      |

## Splits / Windows

| Key            | Action                 |
| -------------- | ---------------------- |
| `<leader>wv`   | Window split vertical  |
| `<leader>wh`   | Window split horizontal|
| `<leader>we`   | Window equalize splits |
| `<leader>wx`   | Window close           |
| `<leader>sm`   | Maximize/restore split |
| `Ctrl+h/j/k/l` | Navigate splits        |

## Yank Path

| Key          | Action                   |
| ------------ | ------------------------ |
| `<leader>yp` | Yank absolute path       |
| `<leader>yr` | Yank relative path       |
| `<leader>yf` | Yank filename (with ext) |
| `<leader>yn` | Yank name (no ext)       |
| `<leader>yd` | Yank directory path      |

## Open With External Apps

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>oa` | Open in Antigravity   |
| `<leader>oc` | Open in VS Code       |
| `<leader>od` | Open with default app |
| `<leader>oo` | Open in Obsidian      |
| `<leader>or` | Reveal in Finder      |
| `<leader>ot` | Open Ghostty here     |

## Session

| Key          | Action          |
| ------------ | --------------- |
| `<leader>wr` | Restore session |
| `<leader>ws` | Save session    |

## Markdown

| Key          | Action                            |
| ------------ | --------------------------------- |
| `<leader>mv` | Preview in floating window (glow) |
| `<leader>mp` | Toggle inline rendering           |
| `<leader>me` | Enable inline rendering           |
| `<leader>md` | Disable inline rendering          |

## Tabs

| Key                         | Action          |
| --------------------------- | --------------- |
| `<leader>to`                | New tab         |
| `<leader>tx`                | Close tab       |
| `<leader>tn` / `<leader>tp` | Next / Prev tab |

## Other

| Key                | Action                  |
| ------------------ | ----------------------- |
| `<Esc>`            | Clear search highlights |
| `<leader>tw`       | Toggle line wrap        |
| `<leader>th`       | Toggle inlay hints      |
| `gcc`              | Toggle comment (line)   |
| `gc`               | Toggle comment (motion) |
| `jj` / `jk` / `kj` | Escape to normal mode   |

## VS Code to Neovim Quick Reference

| VS Code              | Neovim               |
| -------------------- | -------------------- |
| Cmd+P                | `<leader>sf`         |
| Cmd+Shift+F          | `<leader>sg`         |
| Cmd+K V (md preview) | `<leader>mv`         |
| File tree            | `\` or `<leader>e`   |
| New file             | `a` in Neo-tree/Yazi |
| Git panel            | `<leader>lg`         |
| View changes         | `<leader>hp`         |
| Preview file         | `<leader>od`         |
| Copy path            | `<leader>yp`         |
| Copy relative path   | `<leader>yr`         |
