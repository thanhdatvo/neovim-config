local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	-- 	formatting.black.with({ extra_args = { "--fast" } }),
		--[[ formatting.stylua, ]]
    --[[ diagnostics.luacheck, ]]

		--[[ formatting.terraform_fmt, ]]

    formatting.prettierd,
		--[[ diagnostics.eslint_d.with({ ]]
  --[[     diagnostics_format = '[eslint] #{m}\n(#{c})' ]]
  --[[   }), ]]
	}
})
