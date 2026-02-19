" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

-- =================================================================
--  Lazy.nvim bootstrap
-- =================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =================================================================
--  Leader keys (must be set before lazy)
-- =================================================================
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- =================================================================
--  General settings
-- =================================================================
vim.opt.updatetime       = 100
vim.opt.timeoutlen       = 1000
vim.opt.ttimeoutlen      = 50
vim.opt.history          = 10000
vim.opt.undofile         = true
vim.opt.hidden           = true
vim.opt.undolevels       = 100     -- lower than before, but still generous
vim.opt.wrap             = false
vim.opt.swapfile         = false
vim.opt.cursorline       = false
vim.opt.shortmess:append("c")
vim.opt.autoread         = true

-- Folding
vim.opt.foldmethod       = "indent"
vim.opt.foldnestmax      = 10
vim.opt.foldenable       = false
vim.opt.foldlevel        = 2

-- UI
vim.opt.scrolloff        = 8
vim.opt.number           = true
vim.opt.numberwidth      = 8
vim.opt.signcolumn       = "yes"

-- Completion
vim.opt.cmdheight        = 1
vim.opt.pumheight        = 8
vim.opt.completeopt      = { "menuone", "noinsert", "noselect" }

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local line = vim.fn.line([['"]])
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end,
})

-- Arrow keys in normal mode (rare, but you had them)
vim.keymap.set({"n", "v"}, "<C-h>", "<Left>",  { noremap = true })
vim.keymap.set({"n", "v"}, "<C-j>", "<Down>",  { noremap = true })
vim.keymap.set({"n", "v"}, "<C-k>", "<Up>",    { noremap = true })
vim.keymap.set({"n", "v"}, "<C-l>", "<Right>", { noremap = true })

-- Tab navigation
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, i .. "gt", { noremap = true })
end
vim.keymap.set("n", "<leader>0", ":tablast<CR>", { noremap = true })

vim.opt.clipboard        = "unnamedplus"
vim.opt.mouse            = ""

-- Disable F1 help
vim.keymap.set("", "<F1>", "<Nop>", { noremap = true })

-- =================================================================
--  Plugins via lazy.nvim
-- =================================================================
require("lazy").setup({
  -- Appearance / UI
  { "projekt0n/github-nvim-theme",      lazy = false, priority = 1000 },
  { "nvim-lualine/lualine.nvim",        dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "ryanoasis/vim-devicons" },         -- still needed by many
  { "mhinz/vim-startify" },

  -- File / Project navigation
  { "preservim/nerdtree" },
  { "voldikss/vim-floaterm" },

  -- Editing helpers
  { "Yggdroot/indentLine" },
  { "tpope/vim-commentary" },
  { "mg979/vim-visual-multi" },
  { "christoomey/vim-tmux-navigator" },
  { "editorconfig/editorconfig-vim" },

  -- LSP / Completion (keeping CoC – most faithful port)
  { "neoclide/coc.nvim", branch = "release" },

  -- Markdown & preview
  { "instant-markdown/vim-instant-markdown", ft = "markdown" },

  -- PlantUML
  { "aklt/plantuml-syntax" },
  { "tyru/open-browser.vim" },
  { "weirongxu/plantuml-previewer.vim" },

  -- Web dev live preview
  { "turbio/bracey.vim", build = "npm install --prefix server" },

  -- Others (commented ones skipped or replaced)
  -- You can add 'lewis6991/gitsigns.nvim' instead of gitgutter/fugitive
  { "lewis6991/gitsigns.nvim" },
  -- { "tpope/vim-fugitive" },          -- optional
  -- { "airblade/vim-gitgutter" },      -- optional (gitsigns is better)
})

-- =================================================================
--  Plugin configurations
-- =================================================================

-- Theme
vim.o.termguicolors = true
vim.o.background = "light"
vim.cmd("colorscheme github_light")   -- or github_dark, github_dim, etc.

-- lualine (replacement for airline)
require("lualine").setup({
  options = {
    theme = "auto",                     -- will pick up github theme
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators   = { left = "", right = "" },
  },
  extensions = { "quickfix", "fugitive", "nerdtree" },
})

-- indentLine
vim.g.indentLine_char_list = { "|", "¦", "┆", "┊" }

-- Floaterm
vim.api.nvim_set_hl(0, "Floaterm",     { bg = "#e8e8e8" })
vim.api.nvim_set_hl(0, "FloatermBorder", { bg = "#e8e8e8", fg = "#414141" })

vim.g.floaterm_opener    = "tabe"
vim.g.floaterm_autoclose = 2
vim.g.floaterm_width     = 0.9
vim.g.floaterm_height    = 0.9
vim.g.floaterm_wintype   = "float"
vim.g.floaterm_position  = "center"

vim.keymap.set("n", "<leader>d", ":FloatermNew ranger<CR>",  { silent = true })
vim.keymap.set("n", "<leader>r", ":FloatermNew rg --follow -g '!{.git,**/node_modules,**/vendor,**/__pycache__,**/venv}' . 2>/dev/null<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":FloatermNew lazygit<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", ":FloatermNew fzf<CR>",     { silent = true })

-- NERDTree
vim.keymap.set("n", "<leader>n",  ":NERDTreeMirror<CR>:NERDTreeFocus<CR>", { silent = true })
vim.keymap.set("n", "<C-n>",      ":NERDTree<CR>",      { silent = true })
vim.keymap.set("n", "<C-t>",      ":NERDTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-f>",      ":NERDTreeFind<CR>",   { silent = true })

-- Auto open NERDTree mirror in new tabs
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype ~= "quickfix" and vim.fn.getcmdwintype() == "" then
      vim.cmd("silent NERDTreeMirror")
    end
  end,
})

-- Change cwd to current file dir (you had this)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "lcd %:p:h",
})

-- Bracey
vim.keymap.set("n", "<leader>h", ":Bracey<CR>", { silent = true })

-- Visual-multi
vim.g.VM_leader = [[\]]
vim.g.VM_theme  = "lightpurple2"
vim.g.VM_maps   = {
  ["Select All"]      = "<leader>a",
  ["Visual, All"]     = "<leader>a",
  ["Align"]           = "<leader>A",
  ["Add Cursor Down"] = "<A-Down>",
  ["Add Cursor Up"]   = "<A-Up>",
}

-- CoC (almost same mappings – lua style)
vim.g.coc_global_extensions = {
  "coc-sh",
  "coc-tsserver",
  "coc-highlight",
  "coc-go",
  "coc-yaml",
  "coc-html",
  "coc-pyright",
  "coc-java",
  "coc-rls",
  "coc-markdownlint",
  "coc-rust-analyzer",
}

local keymap = vim.keymap.set
local opts   = { silent = true, noremap = true, expr = true }

-- Tab / S-Tab completion (expr mapped)
keymap("i", "<TAB>",   [[coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "<Tab>" : coc#refresh()]], opts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]], opts)

keymap("i", "<CR>",    [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- <c-space> trigger
keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })

-- Diagnostics
keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- GoTo
keymap("n", "gd", "<Plug>(coc-definition)",      { silent = true })
keymap("n", "gy", "<Plug>(coc-type-definition)",  { silent = true })
keymap("n", "gi", "<Plug>(coc-implementation)",   { silent = true })
keymap("n", "gr", "<Plug>(coc-references)",       { silent = true })

-- Documentation
vim.keymap.set("n", "K", function()
  if vim.fn.CocAction("hasProvider", "hover") then
    vim.fn.CocActionAsync("doHover")
  else
    vim.cmd("normal! K")
  end
end, { silent = true })

-- Others (rename, code action, format…)
keymap("n", "<leader>rn", "<Plug>(coc-rename)",        { silent = true })
keymap("n", "<leader>ac", "<Plug>(coc-codeaction)",    { silent = true })
keymap("n", "<leader>qf", "<Plug>(coc-fix-current)",   { silent = true })
keymap("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true })

-- CoCList
keymap("n", "<space>a", ":<C-u>CocList diagnostics<cr>",  { silent = true, nowait = true })
keymap("n", "<space>e", ":<C-u>CocList extensions<cr>",   { silent = true, nowait = true })
keymap("n", "<space>c", ":<C-u>CocList commands<cr>",     { silent = true, nowait = true })
keymap("n", "<space>o", ":<C-u>CocList outline<cr>",      { silent = true, nowait = true })
keymap("n", "<space>s", ":<C-u>CocList -I symbols<cr>",   { silent = true, nowait = true })

-- Optional: add these if you still want :Format / :OR commands
vim.api.nvim_create_user_command("Format", function()
  vim.fn.CocActionAsync("format")
end, {})
vim.api.nvim_create_user_command("OR", function()
  vim.fn.CocActionAsync("runCommand", "editor.action.organizeImport")
end, {})

-- Status line integration (optional)
vim.opt.statusline:prepend(vim.fn["coc#status"]() .. vim.b.coc_current_function or "")

print("Lua config loaded – welcome to modern Neovim!")
