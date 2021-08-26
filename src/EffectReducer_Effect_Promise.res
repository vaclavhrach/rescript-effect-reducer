open Promise

type action<'promise> = unit => 'promise
type callback<'param> = 'param => unit
type success<'response, 'dispatch> = 'response => 'dispatch
type successCallback<'response> = callback<'response>
type error<'error, 'dispatch> = 'error => 'dispatch
type errorCallback<'error> = callback<'error>

let execute = (
  ~action: action<'promise>,
  ~onSuccess: option<success<'response, 'dispatch>>=None,
  ~onSuccessCallback: option<successCallback<'response>>=None,
  ~onError: option<error<'error, 'dispatch>>=None,
  ~onErrorCallback: option<errorCallback<'error>>=None,
  (),
) => {
  dispatch => {
    action()
    ->then(response => {
      switch onSuccess {
      | Some(success) => response->success->dispatch
      | None => ()
      }

      switch onSuccessCallback {
      | Some(callback) => response->callback
      | None => ()
      }

      Ok()->resolve
    })
    ->catch(err => {
      switch err {
      | JsError(obj) =>
        switch Js.Exn.message(obj) {
        | Some(message) => {
            switch onError {
            | Some(error) => message->error->dispatch
            | None => ()
            }

            switch onErrorCallback {
            | Some(callback) => message->callback
            | None => ()
            }
          }
        | None => ()
        }
      | _ => ()
      }

      Error()->resolve
    })
  }
}

let either = (
  action: action<'promise>,
  onSuccess: success<'response, 'dispatch>,
  onError: error<'error, 'dispatch>,
) => execute(~action, ~onSuccess=Some(onSuccess), ~onError=Some(onError), ())

let perform = (
  action: action<'promise>,
  onSuccess: success<'response, 'dispatch>,
  onErrorCallback: errorCallback<'error>,
) => execute(~action, ~onSuccess=Some(onSuccess), ~onErrorCallback=Some(onErrorCallback), ())

let attempt = (
  action: action<'promise>,
  onSuccessCallback: successCallback<'response>,
  onError: error<'error, 'dispatch>,
) => execute(~action, ~onSuccessCallback=Some(onSuccessCallback), ~onError=Some(onError), ())
