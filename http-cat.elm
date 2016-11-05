import Html exposing (text, div, h2, img, button, Html)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src)
import Html.App as App



main =
  App.program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }



-- MODEL


type alias Model =
  { topic : String
  , gifUrl : String
  }


init : (Model, Cmd Msg)
init =
  (Model "cats" "waiting.gif", Cmd.none)



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ h2 [] [ text model.topic ]
    , img [ src model.gifUrl ] []
    , button [ onClick MorePlease ] [ text "More Please!" ]
    ]



-- UPDATE


type Msg = MorePlease


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MorePlease ->
      (model, Cmd.none)



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
