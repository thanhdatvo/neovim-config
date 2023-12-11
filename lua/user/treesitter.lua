local configs = require("nvim-treesitter.configs") 
--local configs = require("ts_context_commentstring")
--[[ require('ts_context_commentstring').setup {} and set  ]]
vim.g.skip_ts_context_commentstring_module = true
configs.setup {
  --ensure_installed = "all",
  ensure_installed = { "lua", "rust","go", "javascript" },
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
