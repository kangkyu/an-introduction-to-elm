import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (type', placeholder, style)
import Html.Events exposing (onInput, onClick)



main =
  App.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  , validOrInvalid : ValidationResult
  }


type ValidationResult
  = NotDone
  | Invalid
  | Valid


model : Model
model =
  { name = ""
  , password = ""
  , passwordAgain = ""
  , validOrInvalid = NotDone
  }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "password", placeholder "Password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , button [ onClick Submit ] [ text "submit" ]
    , viewValidation model
    ]


viewValidation : Model -> Html Msg
viewValidation model =
  let
    (color, message) =
      case model.validOrInvalid of
        NotDone ->
          ("", "")

        Valid ->
          ("Green", "okay!")

        Invalid ->
          ("Red", "two passwords do not match")

  in
    div [ style [("color", color)] ] [ text message ]



-- UPDATE


type Msg
  = None
  | Name String
  | Password String
  | PasswordAgain String
  | Submit


update : Msg -> Model -> Model
update msg model =
  case msg of
    None ->
      model

    Name string ->
      { model | name = string }

    Password string ->
      { model | password = string }

    PasswordAgain string ->
      { model | passwordAgain = string }

    Submit ->
      { model | validOrInvalid = validate model }


validate : Model -> ValidationResult
validate model =
  if (model.password == model.passwordAgain) then
    Valid
  else
    Invalid
