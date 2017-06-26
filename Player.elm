module Player exposing (newPlayer, addResource, removeResource, addTechnology, removeTechnology, technologyEffects, resourceTypes)

import Types exposing (..)

-- Public functions

newPlayer : Player
newPlayer = { resources = []
            , resourceTypes = baseTypes
            , technologies = []
            }

addResource : NaturalResource -> Player -> Player
addResource resource player =
    let
        newResources = player.resources ++ [resource]
    in
        updatePlayer {player | resources = newResources}

removeResource : NaturalResource -> Player -> Player
removeResource resource player =
    let
        newResources = List.filter (\r -> r /= resource) player.resources
    in
        updatePlayer {player | resources = newResources}

addTechnology : Technology -> Player -> Player
addTechnology technology player =
    let
        newTechnologies = player.technologies ++ [technology]
    in
      updatePlayer {player | technologies = newTechnologies}

removeTechnology : Technology -> Player -> Player
removeTechnology technology player =
    let
        newTechnologies = List.filter (\t -> t /= technology) player.technologies
    in
      updatePlayer {player | technologies = newTechnologies}

technologyEffects : Player -> List TechnologyEffectCondition
technologyEffects player =
    player.technologies
    |> List.concatMap (\{effects} -> effects)
    |> List.filter (playerHasRequirementsForEffect player)

resourceTypes : Player -> List ResourceType
resourceTypes player =
    baseTypes ++ resourceTypesFromTechnology player


-- Private functions

updatePlayer : Player -> Player
updatePlayer player =
    { player | resourceTypes = resourceTypes player}

baseTypes : List ResourceType
baseTypes = [ Types.Protein, Types.Carbohydrate ]


resourceTypesFromTechnology : Player -> List ResourceType
resourceTypesFromTechnology player =
    List.filterMap addResourceTypeByEffect <| technologyEffects player


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
