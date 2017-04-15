module Civilisationsspelet exposing (main)

import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Types exposing (..)
import Resources exposing (resources)
import ProductionOutput
import NaturalResourceList
import TechnologyList
import Player

main = Html.beginnerProgram
       { model = initialModel
       , update = update
       , view = view
       }

-- MODEL


initialModel : Model
initialModel = Player.newPlayer

-- UPDATE

update : Msg -> Model -> Model
update msg model =
    case msg of
        AddResource resource ->
            NaturalResourceList.addResource resource model
            |> Player.updatePlayer
        RemoveResource resource ->
            NaturalResourceList.removeResource resource model
            |> Player.updatePlayer
        AddTechnology technology ->
            TechnologyList.addTechnology technology model
            |> Player.updatePlayer
        RemoveTechnology technology ->
            TechnologyList.removeTechnology technology model
            |> Player.updatePlayer
        _ ->
            model


-- VIEW

view : Model -> Html Msg
view model =
    div [ style [("display", "flex"), ("flex-direction", "row") ] ]
        [ ProductionOutput.view model
        , NaturalResourceList.view model
        , TechnologyList.view model
        ]
