module Civilisationsspelet exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Types exposing (..)
import Resources exposing (resources)
import ProductionOutput
import NaturalResourceList
import TechnologyList
import Player
import PlayerStatus
import TechnologyDetail
import NaturalResourceDetail

main = Html.beginnerProgram
       { model = initialModel
       , update = update
       , view = view
       }

-- MODEL


initialModel : Model
initialModel = { player = Player.newPlayer
               , displayTechnology = Nothing
               , displayResource = Nothing
               }

-- UPDATE

update : Msg -> Model -> Model
update msg model =
    case msg of
        AddResource resource ->
            let updatedPlayer = Player.updatePlayer <| NaturalResourceList.addResource resource model.player in
            {model | player = updatedPlayer}
        RemoveResource resource ->
            let updatedPlayer = Player.updatePlayer <| NaturalResourceList.removeResource resource model.player in
            {model | player = updatedPlayer}
        AddTechnology technology ->
            let updatedPlayer = Player.updatePlayer <| TechnologyList.addTechnology technology model.player in
            {model | player = updatedPlayer }
        RemoveTechnology technology ->
            let updatedPlayer = Player.updatePlayer <| TechnologyList.removeTechnology technology model.player in
            {model | player = updatedPlayer}
        DisplayTechnologyDetail technologyId ->
            {model | displayTechnology = technologyId}
        DisplayResourceDetail resourceId ->
            {model | displayResource = resourceId}
        _ ->
            model


-- VIEW

view : Model -> Html Msg
view model =
    div [ style [("display", "flex"), ("flex-direction", "row") ] ]
        [ PlayerStatus.view model.player
        , ProductionOutput.playerOutput model.player
        , NaturalResourceList.view model.player
        , TechnologyList.view model.player
        , TechnologyDetail.view model.displayTechnology
        , NaturalResourceDetail.view model.displayResource
        ]
