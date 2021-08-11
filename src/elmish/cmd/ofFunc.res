module OfFunc = {
  type action<'res> = unit => 'res
  type callback<'param> = 'param => unit
  type success<'res, 'disp> = 'res => 'disp
  type successCallback<'res> = callback<'res>
  type error<'err, 'disp> = 'err => 'disp
  type errorCallback<'err> = callback<'err>

  let execute = (
    ~action: action<'res>,
    ~onSuccess: option<success<'res, 'disp>>=None,
    ~onSuccessCallback: option<successCallback<'res>>=None,
    ~onError: option<error<'err, 'disp>>=None,
    ~onErrorCallback: option<errorCallback<'err>>=None,
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
    action: action<'res>,
    onSuccess: success<'res, 'disp>,
    onError: error<'err, 'disp>,
  ) => execute(~action, ~onSuccess=Some(onSuccess), ~onError=Some(onError), ())

  let perform = (
    action: action<'res>,
    onSuccess: success<'res, 'disp>,
    onErrorCallback: errorCallback<'err>,
  ) => execute(~action, ~onSuccess=Some(onSuccess), ~onErrorCallback=Some(onErrorCallback), ())

  let attempt = (
    action: action<'res>,
    onSuccessCallback: successCallback<'res>,
    onError: error<'err, 'disp>,
  ) => execute(~action, ~onSuccessCallback=Some(onSuccessCallback), ~onError=Some(onError), ())
}
