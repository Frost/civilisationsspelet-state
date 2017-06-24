module Civilisationsspelet exposing (main)

import Html exposing (program, Html, text, button, main_, menu)
import Html.Events exposing (onClick)
import Types exposing (..)
import NaturalResourceList
import TechnologyList
import Player

import Storage exposing (saveState, loadState, fetch)

import PlayerBoard exposing (view)

main : Program Never Model Msg
main = program
       { init = init
       , update = update
       , view = view
       , subscriptions = subscriptions
       }

-- MODEL

init : (Model, Cmd Msg)
init = (initialModel, Cmd.none)


initialModel : Model
initialModel = { player = Player.newPlayer
               , displayTechnology = Nothing
               , displayResource = Nothing
               }

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        AddResource resource ->
            let updatedPlayer = Player.updatePlayer <| NaturalResourceList.addResource resource model.player in
            ({model | player = updatedPlayer}, saveState updatedPlayer)
        RemoveResource resource ->
            let updatedPlayer = Player.updatePlayer <| NaturalResourceList.removeResource resource model.player in
            ({model | player = updatedPlayer}, saveState updatedPlayer)
        AddTechnology technology ->
            let updatedPlayer = Player.updatePlayer <| TechnologyList.addTechnology technology model.player in
            ({model | player = updatedPlayer }, saveState updatedPlayer)
        RemoveTechnology technology ->
            let updatedPlayer = Player.updatePlayer <| TechnologyList.removeTechnology technology model.player in
            ({model | player = updatedPlayer}, saveState updatedPlayer)
        DisplayTechnologyDetail technologyId ->
            ({model | displayTechnology = technologyId}, Cmd.none)
        DisplayResourceDetail resourceId ->
            ({model | displayResource = resourceId}, Cmd.none)
        LoadState newState ->
            ({model | player = loadState newState model.player}, Cmd.none)
        ClearState ->
            (initialModel, saveState Player.newPlayer)
        _ ->
            (model, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    fetch LoadState

-- VIEW

view : Model -> Html Msg
view model =
    main_ []
        [ menu []
            [ button [ onClick ClearState ] [ text "Rensa / Börja om" ]
            ]
        , PlayerBoard.view model
        ]

