module Form exposing (main)

import Browser
import String
import Regex
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN
main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL
type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }

init : Model
init =
  Model "" "" ""

-- UPDATE
type Msg
  = Name String
  | Password String
  | PasswordAgain String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }
    Password password ->
      { model | password = password }
    PasswordAgain password ->
      { model | passwordAgain = password }

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [
      text "Password format: more than 8 chars and includes upper case, lower case, digit"
    , br [] []
    , viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []

viewValidation : Model -> Html msg
viewValidation model =
  if model.password == "" || model.name == "" || model.passwordAgain == "" then
    div [] [ text "Fill all fields" ]
  else if not <| validatePassword model.password then
    div [ style "color" "red" ] [ text "Password not follows format!" ]
  else if model.password /= model.passwordAgain then
    div [ style "color" "red" ] [ text "Passwords do not match!" ]
  else
    div [ style "color" "green" ] [ text "OK" ]

validatePassword : String -> Bool
validatePassword password =
  String.length password >= 8 && -- more than 8 chars
  Regex.contains lowerCase password && -- includes lowerCase
  Regex.contains upperCase password && -- includes upperCase
  Regex.contains digit password -- includes digit

lowerCase : Regex.Regex
lowerCase =
  Maybe.withDefault Regex.never <|
    Regex.fromString "[a-z]"

upperCase : Regex.Regex
upperCase =
  Maybe.withDefault Regex.never <|
    Regex.fromString "[A-Z]"

digit : Regex.Regex
digit =
  Maybe.withDefault Regex.never <|
    Regex.fromString "[0-9]"