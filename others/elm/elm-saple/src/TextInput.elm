import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN
main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model = { inputText : String }

init : Model
init = { inputText = "" }

-- UPDATE
type Msg = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | inputText = newContent }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [
      input [ placeholder "Text to reverse", value model.inputText, onInput Change ] []
      , div [] [ text (String.reverse model.inputText) ]
    ]