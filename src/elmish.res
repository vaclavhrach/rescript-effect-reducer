include Cmd

type config<'model, 'msg> = {
  init: ('model, Cmd.t<'msg>),
  update: ('model, 'msg) => ('model, Cmd.t<'msg>),
}

let useElmish = ({init, update}) => {
  let (rest, dispatch) = React.useReducer(
    ((state, _), action) => update(state, action),
    init,
  )

  let (state, cmd) = rest

  React.useEffect1(() => {
    dispatch->cmd
    None
  }, [rest])

  (state, dispatch)
}
