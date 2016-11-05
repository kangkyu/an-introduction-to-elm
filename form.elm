import Html.App as App
import Html exposing (..)
import Html.Attributes exposing (type', placeholder)



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
    [ input [ type' "text", placeholder "Name" ] []
    , input [ type' "password", placeholder "Password" ] []
    , input [ type' "password", placeholder "Re-enter Password" ] []
    , div [] [ text "do the two passwords match?"]
    ]



-- UPDATE


type Msg = None


update : Msg -> Model -> Model
update msg model =
  case msg of
    None ->
      model
