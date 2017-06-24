module Encoders exposing (serializePlayer)

import Json.Encode exposing (..)
import Types exposing (..)

serializePlayer : Player -> String
serializePlayer player =
    player
    |> fromPlayer
    |> serializablePlayerEncoder
    |> encode 3

fromPlayer : Player -> SerializablePlayer
fromPlayer player = { resources = List.map (\{id} -> id) player.resources
                    , resourceTypes = player.resourceTypes
                    , technologies = List.map (\{id} -> id) player.technologies
                    }


serializablePlayerEncoder : SerializablePlayer -> Json.Encode.Value
serializablePlayerEncoder player =
    Json.Encode.object
        [
         ("resources",     list <| List.map resourceIdEncoder player.resources),
         ("resourceTypes", list <| List.map resourceTypeEncoder player.resourceTypes),
         ("technologies",  list <| List.map technologyIdEncoder player.technologies)
        ]

resourceIdEncoder : ResourceId -> Value
resourceIdEncoder id =
    case id of
        Beans        -> string "Beans"
        Beef         -> string "Beef"
        Camel        -> string "Camel"
        Cassava      -> string "Cassava"
        Chicken      -> string "Chicken"
        Chickpeas    -> string "Chickpeas"
        Corn         -> string "Corn"
        Cotton       -> string "Cotton"
        Donkey       -> string "Donkey"
        Durra        -> string "Durra"
        Elephant     -> string "Elephant"
        Hemp         -> string "Hemp"
        Horse        -> string "Horse"
        Jute         -> string "Jute"
        Linen        -> string "Linen"
        Llama        -> string "Llama"
        Millet       -> string "Millet" -- Hirs
        Oats         -> string "Oats"
        Pork         -> string "Pork"
        Potatoe      -> string "Potatoe"
        Rice         -> string "Rice"
        Rye          -> string "Rye"
        Sheep        -> string "Sheep"
        Silk         -> string "Silk"
        SoyBean      -> string "SoyBean"
        Sugar        -> string "Sugar"
        WaterBuffalo -> string "WaterBuffalo"
        Wheat        -> string "Wheat"
        Yam          -> string "Yam"

resourceTypeEncoder : ResourceType -> Value
resourceTypeEncoder resourceType =
    case resourceType of
        Textile      -> string "Textile"
        Muscle       -> string "Muscle"
        Protein      -> string "Protein"
        Carbohydrate -> string "Carbohydrate"

technologyIdEncoder : TechnologyId -> Value
technologyIdEncoder id =
    case id of
        Astronomy     -> string "Astronomy"
        BlackPowder   -> string "BlackPowder"
        BookPress     -> string "BookPress"
        BookReligion  -> string "BookReligion"
        Bureaucracy   -> string "Bureaucracy"
        Companies     -> string "Companies"
        Credit        -> string "Credit"
        Drama         -> string "Drama"
        Engineering   -> string "Engineering"
        Irrigation    -> string "Irrigation"
        Law           -> string "Law"
        Litterature   -> string "Litterature"
        Machines      -> string "Machines"
        Mathematics   -> string "Mathematics"
        Metallurgy    -> string "Metallurgy"
        Nationalism   -> string "Nationalism"
        Philosophy    -> string "Philosophy"
        PlantBreeding -> string "PlantBreeding"
        Priesthood    -> string "Priesthood"
        Science       -> string "Science"
        Stirrup       -> string "Stirrup"
        Weaving       -> string "Weaving"
        Wheel         -> string "Wheel"
        Writing       -> string "Writing"

