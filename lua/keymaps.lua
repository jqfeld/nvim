local wk = require("which-key")


wk.register({
    f = {
      name = "Telescope Files", -- optional group name
      f = { function() require("telescope.builtin").find_files() end, "Find file" }, 
      p = { function() require("telescope.builtin").find_files({cwd="~/projects"}) end, "Find in projects" }, 
      P = { function() require("telescope.builtin").find_files({cwd="~/.local/share/nvim/site/pack/packer/start"}) end, "Find in plugins" }, 
      e = { function() require("telescope").extensions.file_browser.file_browser() end, "File Browser" },
      v = { function() require("telescope.builtin").oldfiles() end, "Find in history" }, 

    },
    g = {
        name = "Neogit",
        g = { function () require("neogit").status.create('tab') end, "Open Git status" },

    },
    w = {
        name = "Watson",
        d = { function () R('watson'); require('watson').find_data() end, "Insert data"},
        D = { function () R('watson'); require('watson').find_data({insert=false}) end, "Open data"},
        s = { function () R('watson'); require('watson').find_in('scriptsdir',{insert=false}) end, "Open script"},
        S = { function () R('watson'); require('watson').find_in('scriptsdir',{insert=true}) end, "Insert script"},
        p = { function () R('watson'); require('watson').find_plot() end, "Open plot"},
        n = { function () R('watson'); require('watson').find_plot() end, "Open note"},
    },
    o = {
        name = "Neorg",
        g = { "<cmd>Neorg workspace gtd<CR>", "Workspace gtd"},
        w = { "<cmd>Neorg workspace work<CR>", "Workspace work"},
        p = { "<cmd>Neorg workspace main<CR>", "Workspace private"},
    },
    n = {
        name = "NNN",
        n = { require("FTerm-nnn").nnn_toggle , "Open NNN" },
        v = { require("FTerm-nnn").nnn_vs_toggle, "Open NNN (vertical split)"},
        h = { require("FTerm-nnn").nnn_hs_toggle, "Open NNN (horizontal split)"},
    },
}, { prefix = "<leader>" })
