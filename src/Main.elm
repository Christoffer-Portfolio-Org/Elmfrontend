module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
    Browser.sandbox { init = init, update = update, view = view}

type alias Model = {counter : Int, textcont : String}

init : Model
init = {counter = 0, textcont = ""}

type Msg = Increment | Decrement | Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
        { model | counter = model.counter + 1 }

    Decrement ->
        { model | counter = model.counter - 1}
    
    Change newtext ->
        { model | textcont = newtext}


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model.counter) ]
    , button [ onClick Increment ] [ text "+" ]
    , p [] [text "Hello i am a paragraph"]
    , input [ placeholder "textfield", value model.textcont, onInput Change ] []
    ]