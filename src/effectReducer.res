include Effect

type config<'state, 'action> = {
  init: ('state, Effect.t<'action>),
  update: ('state, 'action) => ('state, Effect.t<'action>),
}

let useEffectReducer = ({init, update}) => {
  let (rest, dispatch) = React.useReducer(
    ((state, _), action) => update(state, action),
    init,
  )

  let (state, effect) = rest

  React.useEffect1(() => {
    dispatch->effect
    None
  }, [rest])

  (state, dispatch)
}
