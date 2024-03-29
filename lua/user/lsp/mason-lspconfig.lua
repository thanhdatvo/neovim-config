local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
    "lua_ls",
		"tsserver", -- typescript-language-server
    --[[ "eslint_d", ]]
    --[[ "tflint", ]]
    --[[ "gopls",  ]]
    --[[ "luaformatter", ]]
    --[[ "luacheck", ]]
    --[[ "delve", ]]
    "gopls",
    --[[ "goimports-reviser", ]]
    "svelte", -- svelte-langauge-server
    "gopls", 
    "rust_analyzer",
    "tailwindcss",

	},
})
