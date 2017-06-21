module TechnologyDetail exposing (view)

import Html exposing (Html, section, h1, h2, p, text)
import Html.Attributes exposing (style)
import Types exposing (..)
import Resources exposing (..)

view : Maybe TechnologyId -> Html Msg
view techId =
    case techId of
        Nothing ->
            section [] []
        Just id ->
            technologyDetailView id


technologyDetailView : TechnologyId -> Html Msg
technologyDetailView id =
    case technologyDetailById id of
        Just (_, name, description) ->
            section []
                [ h1 [] [ text "Info: ", text name ]
                , p [ style [("width", "20em")]] [ text description ]
                ]
        Nothing ->
            text ""

