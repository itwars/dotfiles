--@diagnostic disable: unused-local
-- ┌─────────────────────────────┐
-- │  NeoVim configuration file  │
-- │   Author: Vincent RABAH     │
-- │   Update date: 2025-08-25   │
-- └─────────────────────────────┘

--┌─────────────────────────────────────────────────────┐
--│     What is provided by this Neovim setup:          │
--│                                                     │
--│     . [X] Lazy plugins management                   │
--│     . [X] Alpha: for splash screen /dashboard       │
--│     . [X] Telescope: for highlight, files, ...      │
--│     . [X] Treesitter: for syntax highligh           │
--│     . [X] Neotree: for files browsing               │
--│     . [ ] Mason + Lsp + Cmp: language, completion   │
--│     . [X] Indent Blankline: fancy verticale lines   │
--│     . [X] Autoclose: closing (), {}, "", ...        │
--│     . [X] Lualine: statusline                       │
--│     . [X] Neoview: keep track of cursor position    │
--│     . [X] Notify: nice notification widgets         │
--│     . [X] ToggleTerm: terminal management           │
--│     . [ ] Key menu: key binding reminder            │
--│     . [X] Colorizer: RGB colorized in code          │
--│     . [X] Fluoromachine: colorscheme                │
--│                                                     │
--│ [X] Setup stable         - [ ] Need improvement     │
--│                                                     │
--│     What you need to make it work on the OS:        │
--│                                                     │
--│     . build-base                                    │
--│     . ripgrep                                       │
--│     . imagemagick                                   │
--│     . fd                                            │
--│     . unzip                                         │
--│     . git                                           │
--└─────────────────────────────────────────────────────┘

--┌────────┐
--│ Global │
--└────────┘
vim.api.nvim_exec([[
" True colors
set termguicolors
" Tricks
set ttimeout
set ttimeoutlen=0
set matchtime=0
syntax on
set synmaxcol=128       " disable syntax on large line
set t_ut=               " fuckin 256colors zones in tmux !!!
set expandtab           " replace <TAB> with spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set cursorcolumn
set background=dark
set nowrap
set number
" set autochdir           " important to have the correct directory in Terminal
set noshowmode          " don't show 'INSERT', 'REPLACE', ... as statusline plugin already does
set clipboard+=unnamedplus
]], false)
vim.g.mapleader = ' '

--┌──────┐
--│ Lazy │
--└──────┘
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--┌─────────┐
--│ Plugins │
--└─────────┘
local plugins = {
  { 'goolord/alpha-nvim' },                                                                                                             -- Splash Screen & Dashboard
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },                                       -- Fuzzy Finding: Need to install ripgrep on the OS
  { 'nvim-telescope/telescope-media-files.nvim' },                                                                                      -- Display images
  { 'nvim-telescope/telescope-ui-select.nvim' },                                                                                        -- UI for lsp
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },                                                                           -- Syntax Highlight: Need to install build-base on the OS
  { 'nvim-neo-tree/neo-tree.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim'}},   -- File Browser
  { 'williamboman/mason.nvim' },                                                                                                        -- Install/Manage Language Servers
  { 'williamboman/mason-lspconfig.nvim' },                                                                                              -- Need to install unzip on the OS
  { 'neovim/nvim-lspconfig' },                                                                                                          -- Link Neovim/Language Servers
  { 'nvimtools/none-ls.nvim' },                                                                                                         -- Wrapper Around CLI Linter/Other Tools
  { 'hrsh7th/cmp-nvim-lsp' },                                                                                                           -- ??
  { 'hrsh7th/nvim-cmp' },                                                                                                               -- Completion Engine
  { 'hrsh7th/cmp-buffer' },                                                                                                             -- Source for text in buffer
  { 'hrsh7th/cmp-path' },                                                                                                               -- Source for file system 
  { 'L3MON4D3/luaSnip', dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' } },                                -- Lua Snippet Engine (friendly-snippets comes form vscode)
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl' },                                                                              -- Indent Line
  { 'm4xshen/autoclose.nvim' },                                                                                                         -- Autoclose
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },                                                    -- Status Line
  { 'ecthelionvi/NeoView.nvim' },                                                                                                       -- Keep track of cursor position
  { 'rcarriga/nvim-notify' },                                                                                                           -- Notification popups
  { 'akinsho/toggleterm.nvim' },                                                                                                        -- Terminal
  { 'emmanueltouzery/key-menu.nvim' },                                                                                                  -- Menu for key binding remaiders 
  { 'NvChad/nvim-colorizer.lua' },                                                                                                      -- RGB colorized in code
  { 'maxmx03/fluoromachine.nvim', lazy = false, priority = 1000, },                                                                     -- Colorsheme
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000, },
  { 'rose-pine/neovim', lazy = false, priority =1000, },
}
local opts = {
  ui = {
    border = "rounded",
  },
  install = {
    --colorscheme = { "fluoromachine" },
    colorscheme = { "tokyonight-moon" },
  },
  performance = {
    cache = {
      enable = true,
    },
	  rtp = {
		  disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
			},
		},
	},
}

--┌──────┐
--│ Lazy │
--└──────┘
require('lazy').setup(plugins,opts)

--┌───────┐
--│ Alpha │
--└───────┘
local alpha = require('alpha')
local dashboard = require('alpha.themes.startify')
dashboard.section.header.val = {
  [[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                            Vincent RABAH                              ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
}
 _Gopts = {position = "center",hl = "Type",}
-- dashboard.section.footer.val = "Vincent RABAH"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

--┌───────────┐
--│ Telescope │
--└───────────┘
local builtin = require('telescope.builtin')
local telescope = require('telescope')
local vimgrep_arguments = {
  "rg",
  "--follow",        -- Follow symbolic links
  "--hidden",        -- Search for hidden files
  "--no-heading",    -- Don't group matches by each file
  "--with-filename", -- Print the file path with the matched lines
  "--line-number",   -- Show line numbers
  "--column",        -- Show column numbers
  "--smart-case",    -- Smart case search
  -- Exclude some patterns from search
  "--glob=!**/.git/*",
  "--glob=!**/.idea/*",
  "--glob=!**/.vscode/*",
  "--glob=!**/build/*",
  "--glob=!**/dist/*",
  "--glob=!**/yarn.lock",
  "--glob=!**/package-lock.json",
}
require('telescope').load_extension('media_files')
telescope.setup({
  defaults = {hidden = true, vimgrep_arguments = vimgrep_arguments},
  pickers = {
     find_files= {hidden = true, find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }},
     live_grep = {hidden = true, find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" }},
  },
  extensions  = {
    media_files = {filetypes = {"png", "webp", "jpg", "jpeg", "avif", "svg"}, find_cmd = "rg" },
    ['ui-select'] = require('telescope.themes').get_dropdown {} 
  },
})
require('telescope').load_extension('ui-select')
vim.keymap.set('n', '<leader>f', builtin.find_files, {silent = true, noremap = true, desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>g', builtin.live_grep,  {silent = true, noremap = true, desc = 'Telescope live grep' })

--┌────────────┐
--│ Treesitter │
--└────────────┘
local config = require('nvim-treesitter.configs')
config.setup({ensure_installed = { "bash", "lua", "html", "css"}, highlight = { enable = true}, indent = { enable = true} })

--┌─────────┐
--│ NeoTree │
--└─────────┘
require('neo-tree').setup({         -- Toggle hidden files 'H'
  close_if_last_window = true,
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignore = false,
    },
    follow_current_file = {
      enable = true,
    }
  }
}) 
vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>',   {silent = true, noremap = true, desc = 'Neotree file explorer'  })
vim.keymap.set('n', '<leader>b', ':Neotree buffers reveal float<CR>', {silent = true, noremap = true, desc = 'Neotree buffers display'})

--┌────────────┐
--│ Colorsheme │
--└────────────┘
require("tokyonight").setup({
  glow = false,
  theme = "tokyonight-moon",
  option = {
    transparent = true, -- Enable/Disable transparency
    bold = true,
    italic = true,
  },
})
vim.cmd.colorscheme("tokyonight-moon")

--┌─────┐
--│ Lsp │
--└─────┘
require('mason').setup({ ui = { border = "rounded" },})
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls","gopls" }, -- Need to install language on the OS
  auto_install = true,
})
local capacities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup({ capacities = capacities })
vim.keymap.set("n","K",vim.lsp.buf.hover, {})
vim.keymap.set({'n','v'},"<leader>a",vim.lsp.buf.code_action, {})
--┌─────────┐
--│ Null-LS │
--└─────────┘
local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.completion.spell,
    null_ls.builtins.formatting.prettierd.with({
			filetypes = {
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
        "bash",
			},
		}),
  }
})

--┌─────────────────────────┐
--│ CMP - Completion Engine │
--└─────────────────────────┘
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- LuaSnip is the snippet engine
    end,
  },
  window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

--┌────────────────────┐
--│ Indent Blank Lines │
--└────────────────────┘
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed",     { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow",  { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue",    { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange",  { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen",   { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet",  { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan",    { fg = "#56B6C2" })
end)
require("ibl").setup { indent = { highlight = highlight, char = '│' } }

--┌───────────┐
--│ Autoclose │
--└───────────┘
require("autoclose").setup()

--┌─────────┐
--│ Lualine │
--└─────────┘
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'delta',    -- According to the main theme (fluoromachine provide 3 themes: delta, retrowave, fluoromachine)
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--┌────────┐
--│ Notify │
--└────────┘
local notify = require('notify')
notify.setup()

--┌─────────┐
--│ NeoView │
--└─────────┘
require("NeoView").setup()

--┌────────────┐
--│ ToggleTerm │
--└────────────┘
local toggleterm = require("toggleterm")
require('toggleterm').setup({
  shade_terminals = false,
  start_in_insert = true,
  persist_mode = false,
  float_opts = {
    border = 'curved'
  }
})
vim.keymap.set('n', '<leader>t', ':ToggleTerm direction=float<CR>', {desc ='Open terminal'})
-- vim.keymap.set('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>', {silent = true, noremap = true, desc = "Open terminal" })

--┌──────────┐
--│ Menu-key │
--└──────────┘
require 'key-menu'.set('n', '<leader>')

--┌───────────────┐
--│ Colorizer RGB │
--└───────────────┘
require 'colorizer'.setup()

--┌────────────────────────────────────────────────────────┐
--│ Function to draw box around text when pressing <F4> key│
--└────────────────────────────────────────────────────────┘
vim.api.nvim_exec([[
function! WrapThem() range
    let lines = getline(a:firstline,a:lastline)
    let maxl = 0
    for l in lines
        let maxl = len(l)>maxl? len(l):maxl
    endfor
    let h1 = '--┌' . repeat('─', maxl+2) . '┐'
    let h2 = '--└' . repeat('─', maxl+2) . '┘'
    for i in range(len(lines))
        let ll = len(lines[i])
        let lines[i] = '--│ ' . lines[i] . repeat(' ', maxl-ll) . ' │'
    endfor  
    let result = [h1]             " Ligne du haut
    call extend(result, lines)   " Le corps du cadre
    call add(result,h2)           " Ligne du bas
    execute a:firstline.','.a:lastline . ' d'
    let s = a:firstline-1<0?0:a:firstline-1
    call append(s, result)
endfunction
]], false)
vim.keymap.set('n', '<leader><F4>', '<CMD>call WrapThem()<CR>')

--┌─────────────┐
--│ Beautifiers │
--└─────────────┘
-- apk add nodejs
-- apk add npm
-- npm -g i js-beautify
vim.api.nvim_create_user_command('Xbeautifyhtml',"norm! ggVG :!js-beautify --type html -s 2 -q -f -<CR>",{bang = true})
vim.api.nvim_create_user_command('Xbeautifyjs',  "norm! ggVG :!js-beautify --type js -s 2 -q -f -<CR>",{bang = true})
vim.api.nvim_create_user_command('Xbeautifycss', "norm! ggVG :!js-beautify --type css -s 2 -q -f -<CR>",{bang = true})
vim.api.nvim_create_user_command('Xbeautifyjson',"%!python -m json.tool",{bang = true})
vim.api.nvim_create_user_command('Xindent',"norm! ggVG='.'",{bang = true})

--┌───────────────┐
--│ Auto Commands │
--└───────────────┘
-- add ", sleep 20" at the end of vim.cmd lines for debugging
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".vimrc",
  callback = function(args)
    vim.cmd('! cp ~/.vimrc ~/dotfiles/.vimrc')
    vim.cmd('! cd ~/dotfiles; git add .vimrc; git commit -m update; git push')
    notify('File .vimrc push to git repository !',  notify.INFO, {title="Autocmd .vimrc"}) 
  end,
  desc = "Github backup of .vimrc.",
  group = autocmd_group,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "init.lua",
  callback = function(args)
    vim.cmd('! cp ~/.config/nvim/init.lua ~/dotfiles/.config/nvim/init.lua')
    vim.cmd('! cd ~/dotfiles; git add .config/nvim/init.lua; git commit -m update; git push')
    notify('File init.lua push to git repository !',  notify.INFO, {title="Autocmd init.lua"})
  end,
  desc = "Github backup of init.lua.",
  group = autocmd_group,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".tmux.conf",
  callback = function(args)
    vim.cmd('! cp ~/.tmux.conf ~/dotfiles/.tmux.conf')
    vim.cmd('! cp ~/scripts/tmux-colima-status.sh ~/dotfiles/scripts/')
    vim.cmd('! cd ~/dotfiles; git add .tmux.conf scripts/*; git commit -m update; git push')
    notify('File .tmux.conf push to git repository !',  notify.INFO, {title="Autocmd .tmux.conf"})
  end,
  desc = "Github backup of .tmux.conf.",
  group = autocmd_group,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".bashrc",
  callback = function(args)
    vim.cmd('! cp ~/.bashrc ~/dotfiles/.bashrc')
    vim.cmd('! cp -r ~/.bashrc.d/00exports.sh ~/dotfiles/.bashrc.d/')
    vim.cmd('! cp -r ~/.bashrc.d/aliases.sh   ~/dotfiles/.bashrc.d/')
    vim.cmd('! cp -r ~/.bashrc.d/dotfiles.sh  ~/dotfiles/.bashrc.d/')
    vim.cmd('! cp -r ~/.bashrc.d/env.sh       ~/dotfiles/.bashrc.d/')
    vim.cmd('! cp -r ~/.bashrc.d/functions.sh ~/dotfiles/.bashrc.d/')
    vim.cmd('! cp -r ~/.bashrc.d/history.sh   ~/dotfiles/.bashrc.d/')
    vim.cmd('! cp -r ~/.bashrc.d/prompt.sh    ~/dotfiles/.bashrc.d/')
    vim.cmd('! cp -r ~/.bashrc.d/tmux.sh      ~/dotfiles/.bashrc.d/')
    vim.cmd('! cd ~/dotfiles; git add .bashrc ')
    vim.cmd('! cd ~/dotfiles; git add .bashrc.d/* ; git commit -m update; git push')
    notify('File .bashrc files push to git repository !',  notify.INFO, {title="Autocmd .bashrc files"})
  end,
  desc = "Github backup of .bashrc.",
  group = autocmd_group,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.go" },
    desc = "Auto-format golang files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":!gofmt " .. fileName)
    end,
    group = autocmd_group,
})

--┌──────────────────────────────────┐
--│ Colorize current line and column │
--└──────────────────────────────────┘
vim.cmd('highlight CursorColumn guibg=#530391')
vim.cmd('highlight CursorLine   guibg=#530391')
vim.cmd('highlight WinSeparator guifg=orange' )
