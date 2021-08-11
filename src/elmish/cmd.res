module Cmd = {
  include OfMsg
  include OfCmd
  include OfFunc
  include OfPromise

  type t<'msg> = ('msg => unit) => unit

  let none = _ => ()
}
