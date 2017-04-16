module Player exposing (newPlayer, updatePlayer, technologyEffects)

import Types exposing (..)

newPlayer = { resources = []
            , resourceTypes = baseTypes
            , technologies = []
            }

updatePlayer : Player -> Player
updatePlayer player =
    { player | resourceTypes = resourceTypes player}


-- Private functions


baseTypes : List ResourceType
baseTypes = [ Types.Protein, Types.Carbohydrate ]


resourceTypes : Player -> List ResourceType
resourceTypes player =
    baseTypes ++ resourceTypesFromTechnology player


resourceTypesFromTechnology : Player -> List ResourceType
resourceTypesFromTechnology player =
    List.filterMap addResourceTypeByEffect <| technologyEffects player


technologyEffects : Player -> List TechnologyEffect
technologyEffects player =
    List.concatMap (\tech -> tech.effects) player.technologies


addResourceTypeByEffect : TechnologyEffect -> Maybe ResourceType
addResourceTypeByEffect effect =
    case effect of
        EnableResourceType resourceType _ ->
            Just resourceType
        _ ->
            Nothing
