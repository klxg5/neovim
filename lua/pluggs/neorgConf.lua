local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              scratch = "~/.scratch",
              notes = "~/.notes",
            }
          }
        }
      })
