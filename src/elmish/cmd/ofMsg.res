module OfMsg = {
  let single = (msg, dispatch) => msg->dispatch
  let delayed = (msg, delay, dispatch) => (_ => msg->dispatch)->Js.Global.setTimeout(delay)->ignore
  let batch = (msgs, dispatch) => msgs->Belt.Array.forEach(msg => msg->dispatch)
}
