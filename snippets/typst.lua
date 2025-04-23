return {
  s({ trig = 'nt', },
    { t({
      [[#import "@preview/unify:0.6.1": qty]],
      [[#import "/notes/note.typ": note]],
      ""
    }),
      t([[#note[]]), i(0), t("]") }
  ),
  s({ trig = "drwng" },
    fmt(
      [[
        #figure(
        image("drawings/{filename}", width: 80%),
        caption: [{caption}],
        ) <fig-{filename}>
        ]],
      {
        filename = i(1, "filename"),
        caption = i(2, "caption"),
      }, 
      {repeat_duplicates = true}
    )
  ),
}
