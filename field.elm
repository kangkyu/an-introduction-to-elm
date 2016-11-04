import Html exposing (Html, div, input, text)
import Html.Attributes exposing (placeholder)
import String
import Html.Events exposing (onInput)
import Html.App as App


main : Program Never
main =
  App.beginnerProgram { model = model, view = view, update = update }


type alias Model =
  { content : String }


model : Model
model =
  { content = "" }


view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "reverse it", onInput NewContent ] []
    , div [] [ text (model.content |> String.reverse) ]
    ]


type Msg
  = NewContent String


update : Msg -> Model -> Model
update msg model =
  case msg of
    NewContent newContent ->
      { model | content = newContent }
