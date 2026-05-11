-- =========================================================
-- Fast Lua loader (Neovim 0.9+)
-- =========================================================
vim.loader.enable()
-- =================================================================
--  Lazy.nvim bootstrap
-- =================================================================
local lazypath = vim.fn.stdpath("data") .. "~/.local/share/nvim/lazy/lazy.nvim"
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
vim.opt.updatetime       = 200
vim.opt.timeoutlen       = 1000
vim.opt.ttimeoutlen      = 50
vim.opt.history          = 10000
vim.opt.undofile         = true
vim.opt.hidden           = true
vim.opt.undolevels       = 100
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
  {
    "nickkadutskyi/jb.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme jb")
      vim.o.background = "light"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    priority = 9998,
    config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
      },
      extensions = { "quickfix", "fugitive" },
    })
    end
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup{}
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort = { sorter = "case_sensitive" },
        view = {
          width = 33,
          side = "left",
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        actions = {
          open_file = {
            quit_on_open = false,     -- keep tree open after opening file
            resize_window = true,
            window_picker = {
              enable = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          git_ignored = false,
        },
      })
    end,
  },
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

  -- Others (commented ones skipped or replaced)
  { "lewis6991/gitsigns.nvim" },
})

-- =================================================================
--  Plugin configurations
-- =================================================================

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

-- Buffer Line: Open file with Enter in a new tab
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>",    { desc = "Delete buffer" })
vim.keymap.set("n", "<Tab>",     ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>",   ":bprev<CR>", { desc = "Prev buffer" })

-- Bracey
vim.keymap.set("n", "<leader>h", ":Bracey<CR>", { silent = true })

-- Visual-multi
vim.g.VM_leader = "\\"
vim.g.VM_theme  = "lightpurple2"
vim.g.VM_maps   = {
  ["Add Cursor Down"] = "<A-Down>",
  ["Add Cursor Up"]   = "<A-Up>",
}

-- Tree
local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>n", api.tree.toggle, { desc = "Toggle nvim-tree" })

-- CoC - plugins
vim.g.coc_global_extensions = {
  "coc-sh",
  "coc-tsserver",
  "coc-highlight",
  "coc-go",
  "coc-yaml",
  "coc-html",
  "coc-pyright",
  "coc-java",
  "coc-rust-analyzer",
}

local keymap = vim.keymap.set
local opts   = { silent = true, noremap = true, expr = true }


-- COC - Tab / S-Tab completion (expr mapped)
keymap("i", "<TAB>",   [[coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "<Tab>" : coc#refresh()]], opts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]], opts)

keymap("i", "<CR>",    [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })

-- COC - Diagnostics
keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- COC - Def
-- keymap("n", "gd", "<Plug>(coc-definition)",      { silent = true })
keymap("n", "gd", ":call CocActionAsync('jumpDefinition', 'tabe')<CR>", { silent = true })
keymap("n", "gy", "<Plug>(coc-type-definition)",  { silent = true })
keymap("n", "gi", "<Plug>(coc-implementation)",   { silent = true })
keymap("n", "gr", "<Plug>(coc-references)",       { silent = true })

vim.keymap.set("n", "K", function()
  if vim.fn.CocAction("hasProvider", "hover") then
    vim.fn.CocActionAsync("doHover")
  else
    vim.cmd("normal! K")
  end
end, { silent = true })

-- COC - Others (rename, code action, format…)
keymap("n", "<leader>rn", "<Plug>(coc-rename)",        { silent = true })
keymap("n", "<leader>ac", "<Plug>(coc-codeaction)",    { silent = true })
keymap("n", "<leader>qf", "<Plug>(coc-fix-current)",   { silent = true })
keymap("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true })

-- COC - List
keymap("n", "<space>a", ":<C-u>CocList diagnostics<cr>",  { silent = true, nowait = true })
keymap("n", "<space>e", ":<C-u>CocList extensions<cr>",   { silent = true, nowait = true })
keymap("n", "<space>c", ":<C-u>CocList commands<cr>",     { silent = true, nowait = true })
keymap("n", "<space>o", ":<C-u>CocList outline<cr>",      { silent = true, nowait = true })
keymap("n", "<space>s", ":<C-u>CocList -I symbols<cr>",   { silent = true, nowait = true })

-- COC - Optional: add these if you still want :Format / :OR commands
vim.api.nvim_create_user_command("Format", function()
  vim.fn.CocActionAsync("format")
end, {})
vim.api.nvim_create_user_command("OR", function()
  vim.fn.CocActionAsync("runCommand", "editor.action.organizeImport")
end, {})

print("!")
