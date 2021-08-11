module Self = {
  let signle = (effect, dispatch) => dispatch->effect
  let pair = ((first, second), dispatch) => {
    dispatch->first
    dispatch->second
  }
  let delayed = (effect, delay, dispatch) =>
    (_ => dispatch->effect)->Js.Global.setTimeout(delay)->ignore
  let batch = (effects, dispatch) => effects->Belt.Array.forEach(effect => dispatch->effect)
}
