include Effect

type config<'model, 'action> = {
  init: ('model, Effect.t<'action>),
  update: ('model, 'action) => ('model, Effect.t<'action>),
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
