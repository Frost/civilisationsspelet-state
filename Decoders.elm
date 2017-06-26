module Decoders exposing (deserializePlayer)

import Json.Decode exposing (..)
import Types exposing (..)
import Resources exposing (technologiesById, resourcesById)

deserializePlayer : String -> Result String Player
deserializePlayer json =
    case decodeString serializablePlayerDecoder json of
        Ok player -> Ok (toPlayer player)
        Err reason -> Err reason


toPlayer : SerializablePlayer -> Player
toPlayer player = { resources = resourcesById player.resources
                  , resourceTypes = player.resourceTypes
                  , technologies = technologiesById player.technologies
                  }

serializablePlayerDecoder : Decoder SerializablePlayer
serializablePlayerDecoder =
    map3 SerializablePlayer
        (field "resources" <| list (string |> andThen resourceIdDecoder))
        (field "resourceTypes" <| list (string |> andThen resourceTypeDecoder))
        (field "technologies" <| list (string |> andThen technologyIdDecoder))

resourceTypeDecoder : String -> Decoder ResourceType
resourceTypeDecoder resourceType =
    case resourceType of
        "Textile"      -> succeed Textile
        "Muscle"       -> succeed Muscle
        "Protein"      -> succeed Protein
        "Carbohydrate" -> succeed Carbohydrate
        _              -> fail "Invalid resource type"

resourceIdDecoder : String -> Decoder ResourceId
resourceIdDecoder id =
    case id of
        "Beans"        -> succeed Beans
        "Beef"         -> succeed Beef
        "Camel"        -> succeed Camel
        "Cassava"      -> succeed Cassava
        "Chicken"      -> succeed Chicken
        "Chickpeas"    -> succeed Chickpeas
        "Corn"         -> succeed Corn
        "Cotton"       -> succeed Cotton
        "Donkey"       -> succeed Donkey
        "Durra"        -> succeed Durra
        "Elephant"     -> succeed Elephant
        "Hemp"         -> succeed Hemp
        "Horse"        -> succeed Horse
        "Jute"         -> succeed Jute
        "Linen"        -> succeed Linen
        "Llama"        -> succeed Llama
        "Millet"       -> succeed Millet -- Hirs
        "Oats"         -> succeed Oats
        "Pork"         -> succeed Pork
        "Potatoe"      -> succeed Potatoe
        "Rice"         -> succeed Rice
        "Rye"          -> succeed Rye
        "Sheep"        -> succeed Sheep
        "Silk"         -> succeed Silk
        "SoyBean"      -> succeed SoyBean
        "Sugar"        -> succeed Sugar
        "WaterBuffalo" -> succeed WaterBuffalo
        "Wheat"        -> succeed Wheat
        "Yam"          -> succeed Yam
        _              -> fail "Invalid resource"

technologyIdDecoder : String -> Decoder TechnologyId
technologyIdDecoder id =
    case id of
        "Astronomy"     -> succeed Astronomy
        "BlackPowder"   -> succeed BlackPowder
        "BookPress"     -> succeed BookPress
        "BookReligion"  -> succeed BookReligion
        "Bureaucracy"   -> succeed Bureaucracy
        "Companies"     -> succeed Companies
        "Credit"        -> succeed Credit
        "Drama"         -> succeed Drama
        "Engineering"   -> succeed Engineering
        "Irrigation"    -> succeed Irrigation
        "Law"           -> succeed Law
        "Litterature"   -> succeed Litterature
        "Machines"      -> succeed Machines
        "Mathematics"   -> succeed Mathematics
        "Metallurgy"    -> succeed Metallurgy
        "Nationalism"   -> succeed Nationalism
        "Philosophy"    -> succeed Philosophy
        "PlantBreeding" -> succeed PlantBreeding
        "Priesthood"    -> succeed Priesthood
        "Science"       -> succeed Science
        "Stirrup"       -> succeed Stirrup
        "Weaving"       -> succeed Weaving
        "Wheel"         -> succeed Wheel
        "Writing"       -> succeed Writing
        _               -> fail "Invalid technology"
