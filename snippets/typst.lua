return {
  s({ trig = 'nt', },
    {t({
      [[#import "@preview/unify:0.6.1": qty]],
      [[#import "/notes/note.typ": note]],
      ""
    }),
     t( [[#note[]]),i(0), t("]")}
  ),
}
