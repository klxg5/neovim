return {
    "ahmedkhalf/project.nvim",
    config = function ()
        local project = require'project_nvim'
        local recent = project.get_recent_projects()
        project.setup {}
    end
}
