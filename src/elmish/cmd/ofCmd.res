module OfCmd = {
  let signle = (cmd, dispatch) => dispatch->cmd
  let delayed = (cmd, delay, dispatch) => (_ => dispatch->cmd)->Js.Global.setTimeout(delay)->ignore
  let batch = (cmds, dispatch) => cmds->Belt.Array.forEach(cmd => dispatch->cmd)
}
