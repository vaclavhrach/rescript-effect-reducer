# rescript-effect-reducer

`React.useReducer(...)` on steroids with the possibility of side-effects controlling

## Installation

with npm
```
npm i rescript-effect-reducer
```

or with yarn

```
yarn add rescript-effect-reducer
```

Then add rescript-effect-reducer to `bsconfig.json`:
```
"bs-dependencies": [
    "rescript-effect-reducer"
],.
```

## Usage

TODO

## API

### Effect Module API

#### Types

| Type                          | Signature             | Usage         | Ready to use          |
| ----------------------------- | --------------------- | ------------- | --------------------- |
| `Effect.t`                     | `Effect.t<'action>`   | TODO          | :heavy_check_mark:    |

#### Methods 

| Method                        | Signature         | Usage         | Ready to use          |
| ----------------------------- | ----------------- | ------------- | --------------------- |
| `Effect.none`                 | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Self.single`          | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Self.pair`            | TODO              | TODO          | :x:                   |
| `Effect.Self.delayed`         | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Self.batch`           | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Action.single`        | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Action.pair`          | TODO              | TODO          | :x:                   |
| `Effect.Action.delayed`       | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Action.batch`         | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Function.execute`     | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Function.either`      | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Function.perform`     | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Function.attempt`     | TODO              | TODO          | :heavy_check_mark:    |
| `Effect.Promise.execute`      | TODO              | TODO          | :x:                   |
| `Effect.Promise.either`       | TODO              | TODO          | :x:                   |
| `Effect.Promise.perform`      | TODO              | TODO          | :x:                   |
| `Effect.Promise.attempt`      | TODO              | TODO          | :x:                   |

## Examples

TODO