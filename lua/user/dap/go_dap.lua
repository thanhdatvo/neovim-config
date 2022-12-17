local status_ok, nvim_dap_go = pcall(require, "dap-go")
if not status_ok then
  return
end

nvim_dap_go.setup()
