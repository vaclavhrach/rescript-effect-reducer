module Function = {
  type action<'response> = unit => 'response
  type callback<'param> = 'param => unit
  type success<'response, 'dispatch> = 'response => 'dispatch
  type successCallback<'response> = callback<'response>
  type error<'error, 'dispatch> = 'error => 'dispatch
  type errorCallback<'error> = callback<'error>

  let execute = (
    ~action: action<'response>,
    ~onSuccess: option<success<'response, 'dispatch>>=None,
    ~onSuccessCallback: option<successCallback<'response>>=None,
    ~onError: option<error<'error, 'dispatch>>=None,
    ~onErrorCallback: option<errorCallback<'error>>=None,
    (),
  ) => {
    dispatch => {
      try {
        let result = action()

        switch onSuccess {
        | Some(success) => result->success->dispatch
        | None => ()
        }

        switch onSuccessCallback {
        | Some(callback) => result->callback
        | None => ()
        }
      } catch {
      | Js.Exn.Error(obj) =>
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
      }
    }
  }

  let either = (
    action: action<'response>,
    onSuccess: success<'response, 'dispatch>,
    onError: error<'error, 'dispatch>,
  ) => execute(~action, ~onSuccess=Some(onSuccess), ~onError=Some(onError), ())

  let perform = (
    action: action<'response>,
    onSuccess: success<'response, 'dispatch>,
    onErrorCallback: errorCallback<'error>,
  ) => execute(~action, ~onSuccess=Some(onSuccess), ~onErrorCallback=Some(onErrorCallback), ())

  let attempt = (
    action: action<'response>,
    onSuccessCallback: successCallback<'response>,
    onError: error<'error, 'dispatch>,
  ) => execute(~action, ~onSuccessCallback=Some(onSuccessCallback), ~onError=Some(onError), ())
}
