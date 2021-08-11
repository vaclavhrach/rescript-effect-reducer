type hookResult<'a> = {result: React.ref<'a>}

@module("@testing-library/react-hooks")
external renderHook: (unit => 'a) => hookResult<'a> = "renderHook"

@module("@testing-library/react-hooks")
external act: (unit => unit) => unit = "act"

open Jest
open Expect
open EffectReducer

module Mock = {
  // Model
  type person = {
    name: string,
    age: int,
  }

  type model = {
    value: int,
    person: option<person>,
  }

  // Actions
  type msg =
    | Increment
    | IncrementWithPayload(int)

  // Initialization
  let init = (
    {
      value: 0,
      person: None,
    },
    Effect.none,
  )

  // Update
  let update = (model, msg): (model, Effect.t<msg>) =>
    switch msg {
    | Increment => ({...model, value: model.value + 1}, Effect.none)
    | IncrementWithPayload(payload) => ({...model, value: model.value + payload}, Effect.none)
    }
}

open Mock

test("value should be initialized to \"0\" ", () => {
  let {result} = renderHook(() => useEffectReducer({init: init, update: update}))
  let (state, _) = result.current

  expect(state.value) |> toBe(0)
})

test("value should be incremented from \"0\" (initial value) to \"1\"", () => {
  let {result} = renderHook(() => useEffectReducer({init: init, update: update}))
  let (_, dispatch) = result.current

  act(() => dispatch(Increment))

  let (state, _) = result.current
  expect(state.value) |> toBe(1)
})

test("value should be incremented from \"0\" (initial value) to payload value", () => {
  let {result} = renderHook(() => useEffectReducer({init: init, update: update}))
  let (_, dispatch) = result.current

  act(() => dispatch(IncrementWithPayload(5)))

  let (state, _) = result.current
  expect(state.value) |> toBe(5)
})
