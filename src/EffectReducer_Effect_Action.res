let single = (action, dispatch) => action->dispatch

let delayed = (action, delay, dispatch) =>
  (_ => action->dispatch)->Js.Global.setTimeout(delay)->ignore

let batch = (actions, dispatch) => actions->Belt.Array.forEach(action => action->dispatch)
