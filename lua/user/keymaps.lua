local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Copy to X CLIPBOARD
-- keymap("n"," <leader>cc :w !xsel -i -b<cr>", term_opts)
--[[ map <leader>cp :w !xsel -i -p<CR> ]]
--[[ map <leader>cs :w !xsel -i -s<CR> ]]
--[[ -- Paste from X CLIPBOARD ]]
--[[ map <leader>pp :r!xsel -p<CR> ]]
--[[ map <leader>ps :r!xsel -s<CR> ]]
--[[ map <leader>pb :r!xsel -b<CR> ]]
-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- save file
keymap("n", "<C-s>", ":w<cr>", opts)
keymap("i", "<C-s>", "<esc>:w<cr>", opts)
-- delete current buffer
keymap("n", "<C-w>", ":Bdelete<cr>", opts)



-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- keymap("n", "<leader>f", ":Format<cr>", opts)
--[[ keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts) ]]
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
--[[ keymap( ]]
--[[ 	"n", ]]
--[[ 	"<leader>p", ]]
--[[ 	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", ]]
--[[ 	opts ]]
--[[ ) ]]
keymap(
  "n",
  "<c-p>",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
keymap(
  "n",
  "<leader>p",
  "<cmd>Telescope live_grep<cr>", opts)
--[[ keymap("n", "<c-t>", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.utils').buffer_dir(), {prompt_title = 'find string in open buffers...', grep_open_files = true})<cr>", opts) ]]
-- debug
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)

-- escape
keymap("i", "jj", "<ESC>", { silent = true })
-- quick save 
vim.api.nvim_set_keymap('i', 'zz', '<Esc>:w<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'zz', ':w<CR>', {noremap = true, silent = true})
