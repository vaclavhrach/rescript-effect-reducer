# rescript-effect-reducer

[![npm](https://img.shields.io/npm/v/rescript-effect-reducer)](https://npm.im/rescript-effect-reducer)
[![npm downloads per month](https://img.shields.io/npm/dm/rescript-effect-reducer)](https://npm.im/rescript-effect-reducer)

`React.useReducer(...)` on steroids with the possibility of side-effects controlling

## Installation

install package with npm

```
npm i rescript-effect-reducer
```

or with yarn

```
yarn add rescript-effect-reducer
```

and then add rescript-effect-reducer to `bsconfig.json`:

```json
"bs-dependencies": [
    "rescript-effect-reducer"
]
```

## Usage

The code below shows a simple counter implementation using the `useEffectReducer` hook where it is also possible to adjust the step value in addition to increment and decrement.

```ocaml

open EffectReducer

/* Model */
type state = {
  counter: int,
  step: int,
}

/* Actions */
type actions =
  | Increment
  | Decrement
  | UpdateStep(int)

/* Initialization */
let init = (
  {
    counter: 0,
    step: 1,
  },
  EffectReducer_Effect.none,
)

/* Methods */
let increment = state => ({...state, counter: state.counter + state.step}, EffectReducer_Effect.none)
let decrement = state => ({...state, counter: state.counter - state.step}, EffectReducer_Effect.none)
let updateStep = (state, step) => ({...state, step: step}, EffectReducer_Effect.none)

/* Update */
let update = (state, actions): (state, EffectReducer_Effect.t<actions>) =>
  switch actions {
  | Increment => state->increment
  | Decrement => state->decrement
  | UpdateStep(step) => state->updateStep(step)
  }

/* Styles */
let styles = {
  "container": ReactDOM.Style.make(
    ~display="inline-flex",
    ~alignItems="center",
    ~marginBottom="2em",
    (),
  ),
  "result": ReactDOM.Style.make(~margin="0 1em", ()),
  "button": ReactDOM.Style.make(~width="30px", ~textAlign="center", ()),
}

/* Helpers */
let toString = str => str->React.string

/* Component */
@react.component
let make = () => {
  // Use effect reducer hook
  let (state, dispatch) = useEffectReducer({
    init: init,
    update: update,
  })

  // Event handlers
  let handleStepChange = event =>
    ReactEvent.Form.currentTarget(event)["value"]->int_of_string->UpdateStep->dispatch

  // JSX
  <>
    <h2> {"Counter"->toString} </h2>
    <div style={styles["container"]}>
      <button style={styles["button"]} onClick={_ => dispatch(Increment)}> {"+"->toString} </button>
      <div style={styles["result"]}>
        {("Counter value is: " ++ state.counter->string_of_int)->toString}
      </div>
      <button style={styles["button"]} onClick={_ => dispatch(Decrement)}> {"-"->toString} </button>
    </div>
    <div>
      <strong> {"Step: "->toString} </strong>
      <input
        id="step" type_="number" value={state.step->string_of_int} onChange={handleStepChange}
      />
    </div>
  </>
}

```

## API

### Types

| Type                                    | Description | Usage | Ready to use       |
| --------------------------------------- | ----------- | ----- | ------------------ |
| `EffectReducer.config<'state, 'action>` | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.t<'action>`       | TODO        | TODO  | :heavy_check_mark: |

### Hooks

| Hook                             | Description | Usage | Ready to use       |
| -------------------------------- | ----------- | ----- | ------------------ |
| `EffectReducer.useEffectReducer` | TODO        | TODO  | :heavy_check_mark: |

### Effects

| Effect                                  | Description | Usage | Ready to use       |
| --------------------------------------- | ----------- | ----- | ------------------ |
| `EffectReducer.Effect.none`             | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Self.single`      | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Self.delayed`     | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Self.batch`       | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Action.single`    | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Action.delayed`   | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Action.batch`     | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.execute` | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.either`  | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.perform` | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.attempt` | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Promise.execute`  | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Promise.either`   | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Promise.perform`  | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Promise.attempt`  | TODO        | TODO  | :heavy_check_mark: |

## Examples

TODO
