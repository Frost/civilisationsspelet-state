port module Storage exposing (saveState, loadState, fetch)

import Encoders exposing (serializePlayer)
import Decoders exposing (deserializePlayer)
import Types exposing (Model, Player)

port store : String -> Cmd msg
port fetch : (String -> msg) -> Sub msg

saveState : Player -> Cmd msg
saveState = store << serializePlayer

loadState : String -> Player -> Player
loadState newState existingPlayer =
    case deserializePlayer newState of
        Ok loadedPlayer ->
            loadedPlayer
        Err reason ->
            existingPlayer
