# rescript-effect-reducer

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

```
"bs-dependencies": [
    "rescript-effect-reducer"
],.
```

## Usage

```ocaml

open EffectReducer

/* Model */
type state = {
    counter: int,
    step: int
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
        step: 1
    },
    Effect.none
)

/* Methods */
let increment = model => ({ ...model, counter: model.counter + model.step }, Effect.none)
let decrement = model => ({ ...model, counter: model.counter - model.step }, Effect.none)
let updateStep = (model, step) => ({ ...model, step: step )}, Effect.none)

/* Update */
let update = (state, msg): (state, Effect.t<actions>) =>
    switch actions {
    | Increment => model->increment
    | Decrement => model->decrement
    | UpdateStep(step) => model->updateStep(step)
    }

/* Component */
@react.component
let make = () => {
    let (state, dispatch) = useEffectReducer({
        init: init,
        update: update
    })

    <>
        ... your ui here ...
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
| `EffectReducer.Effect.Self.pair`        | TODO        | TODO  | :x:                |
| `EffectReducer.Effect.Self.delayed`     | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Self.batch`       | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Action.single`    | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Action.pair`      | TODO        | TODO  | :x:                |
| `EffectReducer.Effect.Action.delayed`   | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Action.batch`     | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.execute` | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.either`  | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.perform` | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Function.attempt` | TODO        | TODO  | :heavy_check_mark: |
| `EffectReducer.Effect.Promise.execute`  | TODO        | TODO  | :x:                |
| `EffectReducer.Effect.Promise.either`   | TODO        | TODO  | :x:                |
| `EffectReducer.Effect.Promise.perform`  | TODO        | TODO  | :x:                |
| `EffectReducer.Effect.Promise.attempt`  | TODO        | TODO  | :x:                |

## Examples

TODO
