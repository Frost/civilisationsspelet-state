port module Civilisationsspelet exposing (main)

import Html exposing (program, Html, div, text, button)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Types exposing (..)
import Resources exposing (resources)
import ProductionOutput
import NaturalResourceList
import TechnologyList
import Player
import PlayerStatus
import TechnologyDetail
import NaturalResourceDetail
import Encoders exposing (serializePlayer)
import Decoders exposing (deserializePlayer)

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
            ({model | player = updatedPlayer}, store <| serializePlayer updatedPlayer)
        RemoveResource resource ->
            let updatedPlayer = Player.updatePlayer <| NaturalResourceList.removeResource resource model.player in
            ({model | player = updatedPlayer}, store <| serializePlayer updatedPlayer)
        AddTechnology technology ->
            let updatedPlayer = Player.updatePlayer <| TechnologyList.addTechnology technology model.player in
            ({model | player = updatedPlayer }, store <| serializePlayer updatedPlayer)
        RemoveTechnology technology ->
            let updatedPlayer = Player.updatePlayer <| TechnologyList.removeTechnology technology model.player in
            ({model | player = updatedPlayer}, store <| serializePlayer updatedPlayer)
        DisplayTechnologyDetail technologyId ->
            ({model | displayTechnology = technologyId}, Cmd.none)
        DisplayResourceDetail resourceId ->
            ({model | displayResource = resourceId}, Cmd.none)
        LoadState newState ->
            case deserializePlayer newState of
                Ok loadedPlayer ->
                    ({model | player = loadedPlayer}, Cmd.none)
                Err reason ->
                    (model, Cmd.none)
        ClearState ->
            (initialModel, store <| serializePlayer Player.newPlayer)
        _ ->
            (model, Cmd.none)

-- SUBSCRIPTIONS

port store : String -> Cmd msg
port fetch : (String -> msg) -> Sub msg

subscriptions : Model -> Sub Msg
subscriptions model =
    fetch LoadState

-- VIEW

view : Model -> Html Msg
view model =
    div [ style [("width", "100%"), ("display", "flex"), ("flex-direction", "row") ] ]
        [ div [style []]
              [ button [ onClick ClearState ] [ text "Rensa / Börja om" ]
              , div [ style [("display", "flex"), ("flex-direction", "row"), ("flex-grow", "1")] ]
                    [ PlayerStatus.view model.player
                    , ProductionOutput.playerOutput model.player
                    ]

              , TechnologyDetail.view model.displayTechnology
              , NaturalResourceDetail.view model.displayResource
              ]
        , NaturalResourceList.view model.player
        , TechnologyList.view model.player
        ]
