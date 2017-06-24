module PlayerBoard exposing (view)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (style)
import Types exposing (Model, Msg)

import NaturalResourceDetail
import NaturalResourceList
import PlayerStatus
import ProductionOutput
import TechnologyDetail
import TechnologyList

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Spelarbräde" ]
        , div [ style [("width", "100%"), ("display", "flex"), ("flex-direction", "row") ] ]
            [ NaturalResourceList.view model.player
            , TechnologyList.view model
            , div [style []]
                [ ProductionOutput.playerOutput model.player
                , PlayerStatus.view model.player
                ]
            , div [ style [("flex-grow", "0")]]
                [ TechnologyDetail.view model.displayTechnology
                , NaturalResourceDetail.view model.displayResource
                ]
            , div [ style [("flex-grow", "1")]] []
            ]
        ]
