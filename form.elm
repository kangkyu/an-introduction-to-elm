import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (type', placeholder, style)
import Html.Events exposing (onInput)



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
  }


model : Model
model =
  { name = ""
  , password = ""
  , passwordAgain = ""
  }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "password", placeholder "Password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , viewValidation model
    ]


viewValidation : Model -> Html Msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordAgain then
        ("Green", "okay!")
      else
        ("Red", "two passwords do not match")
  in
    div [ style [("color", color)] ] [ text message ]



-- UPDATE


type Msg
  = None
  | Name String
  | Password String
  | PasswordAgain String


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
