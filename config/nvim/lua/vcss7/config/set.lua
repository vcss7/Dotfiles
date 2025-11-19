vim.opt.guicursor = {
	"n-v-c:block",		-- normal, visual, command mode: block cursor
	"i-ci-ve:ver25",	-- insert, command insert, visual selection mode: vertical cursor
	"r-cr:hor20",		-- replace, command replace mode: horizonal cursor
	"o:hor50",			-- operator-pending mode: horizontal cursor
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",	-- all modes: blinking
	"sm:block-blinkwait175-blinkoff150-blinkon175"			-- showmatch insert mode: blinking
}

-- Enable line numbering
vim.opt.nu = true               -- abosulte line numbers
vim.opt.relativenumber = true   -- relative number line numbers

-- Tab configurations
vim.opt.tabstop = 4         -- set width of a tab character
vim.opt.softtabstop = 4     -- set width of tab counts for editing
vim.opt.shiftwidth = 4      -- set width of each level of indentation
vim.opt.expandtab = true    -- convert tabs to spaces

-- Automatically adjust indentation
vim.opt.smartindent = true  -- enable smart indentation

-- Disable line wrapping
vim.opt.wrap = false    -- don't wrap lines

-- Disable swap file and backup files for clean environments
vim.opt.swapfile = false    -- disable swap files
vim.opt.backup = false      -- disable backup files

-- Undo file configurations
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- set undo directory
vim.opt.undofile = true     -- enable undo history across sessions

-- Search configurations
vim.opt.hlsearch = false    -- disable search highlight
vim.opt.incsearch = true    -- incremental search (search while typing)

-- GUI color configuration
vim.opt.termguicolors = true    -- enable RGB color support

-- Scrolling and sign column configurations
vim.opt.scrolloff = 8           -- scroll file before reaching bottom
vim.opt.signcolumn = "yes"      -- always show sign column

-- Append to list of acceptable file name characters
vim.opt.isfname:append("@-@")   -- allow `@` and `-`

-- Timing configurations
vim.opt.updatetime = 50     -- millis before updating file status

-- Highlight column
vim.opt.colorcolumn = "80"  -- highligh column

-- Paste mode
vim.opt.paste = false       -- disable easier pasting
