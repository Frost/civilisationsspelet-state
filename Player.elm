-- module Player exposing (newPlayer, updatePlayer, addResource, technologyEffects)
module Player exposing (..)

import Types exposing (..)
import NaturalResourceList
import TechnologyList

newPlayer : Player
newPlayer = { resources = []
            , resourceTypes = baseTypes
            , technologies = []
            }

updatePlayer : Player -> Player
updatePlayer player =
    { player | resourceTypes = resourceTypes player}

addResource : NaturalResource -> Player -> Player
addResource resource player =
    updatePlayer <| NaturalResourceList.addResource resource player

removeResource : NaturalResource -> Player -> Player
removeResource resource player =
    updatePlayer <| NaturalResourceList.removeResource resource player

addTechnology : Technology -> Player -> Player
addTechnology technology player =
    updatePlayer <| TechnologyList.addTechnology technology player

removeTechnology : Technology -> Player -> Player
removeTechnology technology player =
    updatePlayer <| TechnologyList.removeTechnology technology player
-- Private functions


baseTypes : List ResourceType
baseTypes = [ Types.Protein, Types.Carbohydrate ]


resourceTypes : Player -> List ResourceType
resourceTypes player =
    baseTypes ++ resourceTypesFromTechnology player


resourceTypesFromTechnology : Player -> List ResourceType
resourceTypesFromTechnology player =
    List.filterMap addResourceTypeByEffect <| technologyEffects player


technologyEffects : Player -> List TechnologyEffectCondition
technologyEffects player =
    player.technologies
    |> List.concatMap (\{effects} -> effects)
    |> List.filter (playerHasRequirementsForEffect player)


addResourceTypeByEffect : TechnologyEffectCondition -> Maybe ResourceType
addResourceTypeByEffect (effect, _) =
    case effect of
        EnableResourceType resourceType ->
            Just resourceType
        _ ->
            Nothing


-- filter technology effects by requirements
playerHasRequirementsForEffect : Player -> TechnologyEffectCondition -> Bool
playerHasRequirementsForEffect player (effect, condition) =
    case condition of
        None ->
            True
        OneResourceNeeded resources ->
            List.any (\r -> List.member r <| resourceIds player) resources


resourceIds : Player -> List ResourceId
resourceIds player =
    List.map (\{id} -> id) player.resources
