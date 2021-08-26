module Action = EffectReducer_Effect_Action
module Function = EffectReducer_Effect_Function
module Promsie = EffectReducer_Effect_Promise
module Self = EffectReducer_Effect_Self

type t<'action> = ('action => unit) => unit

let none = _ => ()
