local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end
local function restore_nvim_tree()
    local nvim_tree = require('nvim-tree')
    nvim_tree.change_dir(vim.fn.getcwd())
    --[[ nvim_tree.refresh() ]]
  
    require("nvim-tree.api").tree.open({ focus = true })
    --[[ require("lualine").refresh() ]]
end

auto_session.setup {
  --[[ auto_session_enable_last_session = true, ]]
  --[[ auto_restore_enabled = true, ]]
  --[[ auto_save_enabled = true, ]]
  post_restore_cmds = {restore_nvim_tree}, 
   pre_save_cmds = {"NvimTreeClose"},
    --[[ pre_save_cmds = { "NvimTreeClose" }, ]]
      --[[ pre_restore_cmds = { "NvimTreeToggle" }, ]]
    --[[   cwd_change_handling = { ]]
    --[[     restore_upcoming_session = true, ]]
    --[[     pre_restore_cmds = { "NvimTreeOpen" }, -- having this or not, still same result ]]
    --[[   }, ]]
}

