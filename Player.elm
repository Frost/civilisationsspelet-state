module Player exposing (newPlayer, updatePlayer)

import Types exposing (Player, Technology, NaturalResource, ResourceType)

newPlayer = { resources = []
            , resourceTypes = baseTypes
            , technologies = []
            }

updatePlayer : Player -> Player
updatePlayer player =
    { player | resourceTypes = resourceTypes player}

resourceTypes : Player -> List ResourceType
resourceTypes player =
    List.foldr addResourceTypeByTechnology baseTypes player.technologies

baseTypes : List ResourceType
baseTypes = [ Types.Protein, Types.Carbohydrate ]

-- add Textile if techlonogy is "weaving"
-- add Muscle if techlonogy is "wheel"
addResourceTypeByTechnology : Technology -> List ResourceType -> List ResourceType
addResourceTypeByTechnology technology types =
    case technology.id of
        "wheel" ->
            types ++ [Types.Muscle]
        "weaving" ->
            types ++ [Types.Textile]
        _ ->
            types

