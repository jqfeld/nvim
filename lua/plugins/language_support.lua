-- plugins for various programming languages

return {

  {
    "jqfeld/drwatson.nvim",
    dev = true,
    config = function()
      -- require('cmp').register_source('drwatson', require('drwatson/cmp_source').new())
    end,
    keys = {
      { "<Leader>wd", function() require('drwatson').find_data() end, desc = "Find data" },
    }
  },

}
