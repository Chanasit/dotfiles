-- general
lvim.leader = ","
lvim.format_on_save = true
-- lvim.keys.normal_mode = {
--   ["<Tab>"] = ":bprevious<CR>",
--   ["<S-Tab>"] = ":bnext<CR>",
-- }

-- unmap a default keymapping
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["e"] = { "<cmd>RnvimrToggle<CR>", "Ranger" }
lvim.builtin.which_key.mappings["d"] = { "<cmd>FloatermNew nnn -deH<CR>", "NNN" }
lvim.builtin.which_key.mappings["r"] = { "<cmd>FloatermNew rg -g '!{.git,node_modules,vendor}/*' 2> /dev/null<CR>", "Ripgrep" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>FloatermNew fzf<CR>", "FZF" }

-- colors
lvim.colorscheme = "xcodedark"

-- option
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.foldexpr = ""
vim.opt.timeoutlen = 300
-- vim.opt.termguicolors = true
vim.opt.pumheight = 8
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.updatetime = 200
vim.opt.numberwidth = 13
vim.opt.signcolumn = "yes"
vim.opt.spelllang = "en"

-- Configure builtin plugins
lvim.builtin.lualine.active = true
lvim.builtin.dashboard.active = false
lvim.builtin.dap.active = false
lvim.builtin.terminal.active = false
lvim.builtin.bufferline.active = true
lvim.builtin.project.active = false
lvim.builtin.nvimtree.active = false

-- Treesitter parsers change this to a table of the languages you want i.e. {"java", "python", javascript}
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }

vim.cmd([[
  set mouse=
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>
  vnoremap <up> <nop>
  vnoremap <down> <nop>
  vnoremap <left> <nop>
  vnoremap <right> <nop>
]])
-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false

-- Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
vim.list_extend(lvim.lsp.override, { "pyright" })

-- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black" },
--   {
--     exe = "prettier",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "black" },
--   {
--     exe = "eslint_d",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "javascriptreact" },
--   },
-- }


-- Additional Plugins
lvim.plugins = {
    {"arzg/vim-colors-xcode"},
    {
      "mg979/vim-visual-multi",
      config = function ()
      vim.g.VM_theme = "lightpurple2"
      end,
    },
    {"aklt/plantuml-syntax"},
    {"weirongxu/plantuml-previewer.vim"},
    {"tyru/open-browser.vim"},
    {"editorconfig/editorconfig-vim"},
    {"instant-markdown/vim-instant-markdown"},
    {
      "voldikss/vim-floaterm",
      config = function()
      vim.g.floaterm_opener = "tabe"
      vim.g.floaterm_autoclose = 2
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_wintype = "float"
      end,
    }
}