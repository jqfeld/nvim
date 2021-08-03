local iron = require('iron')

iron.core.add_repl_definitions {
  julia = {
    julia_file = {
      command = {"julia", "--project=@."}
    }
  }
}

iron.core.set_config {
  preferred = {
    julia = "julia_file"
  },
  repl_open_cmd = "rightbelow split"
}



require('kommentary.config').configure_language("julia", {
    single_line_comment_string = "#",
    multi_line_comment_string = {"#=", "=#"},
    prefer_single_line_comments = true,
})
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})



--[[ require('neuron').setup {
    neuron_dir = "~/Dropbox/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
}
 ]]
