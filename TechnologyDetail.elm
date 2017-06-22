module TechnologyDetail exposing (view)

import Html exposing (Html, section, h1, h2, p, text, div, ul, li)
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
            case technologyById id of
                Just technology ->
                    section []
                        [ h1 [] [ text "Info: ", text name ]
                        , p [ style [("width", "20em")]] [ text description ]
                        , requirementsView technology
                        , providesView technology
                        ]
                Nothing ->
                    text ""
        Nothing ->
            text ""

requirementsView : Technology -> Html Msg
requirementsView {requirements} =
    case List.length requirements of
        0 ->
            text ""
        _ ->
            div []
                [ h2 [] [ text "Krav" ]
                , technologyIdList requirements
                ]

providesView : Technology -> Html Msg
providesView {provides} =
    case List.length provides of
        0 ->
            text ""
        _ ->
            div []
                [ h2 [] [ text "Ger tillgång till" ]
                , technologyIdList provides
                ]


technologyIdList : List TechnologyId -> Html Msg
technologyIdList ids =
    ul []
        (List.map (\id -> li [] [ text <| technologyName id]) ids)
