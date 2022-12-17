local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require "user.lsp.mason-lspconfig"

vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

--[[ require("user.lsp.handlers").setup() ]]
require("user.lsp.handlers")
require "user.lsp.null-ls"


