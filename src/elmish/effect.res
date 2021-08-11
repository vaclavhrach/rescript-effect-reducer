module Effect = {
  include Action
  include Function
  include Promise
  include Self

  type t<'action> = ('action => unit) => unit

  let none = _ => ()
}
