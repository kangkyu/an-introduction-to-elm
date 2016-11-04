import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.App as App


main : Program Never
main =
  App.beginnerProgram { model = model, view = view, update = update }


type alias Model = Int


model : Model
model = 0


view : Int -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model)]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Reset ] [ text "reset button" ]
    ]


type Msg = Increment | Decrement | Reset


update : Msg -> Int -> Int
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

    Reset ->
      0
