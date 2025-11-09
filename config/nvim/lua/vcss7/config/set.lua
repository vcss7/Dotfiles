vim.opt.guicursor = {
	"n-v-c:block",		-- normal, visual, command mode: block cursor
	"i-ci-ve:ver25",	-- insert, command insert, visual selection mode: vertical cursor
	"r-cr:hor20",		-- replace, command replace mode: horizonal cursor
	"o:hor50",			-- operator-pending mode: horizontal cursor
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",	-- all modes: blinking
	"sm:block-blinkwait175-blinkoff150-blinkon175"			-- showmatch insert mode: blinking
}

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept("<CR>")', {silent = true , expr = true})

