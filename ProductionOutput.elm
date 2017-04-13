module ProductionOutput exposing (productionOutputTable)

import Types exposing (..)
import Resources exposing (..)
import Html exposing (Html, table, thead, tbody, tr, th, td, text)

productionOutputTable : Player -> Html Msg
productionOutputTable player =
    table []
        [ thead []
              [ tr []
                    [ th [] [ text "Klimatzon" ]
                    , th [] [ text "Produktion" ]
                    ]
              ]
        , tbody []
            (List.map climateZoneOutputView <| output player)
        ]
-- Render output for a climate zone
climateZoneOutputView : Produce -> Html Msg
climateZoneOutputView (zoneType, value) =
    tr []
        [ td [] [ text (zoneTranslation zoneType) ]
        , td [] [ text (toString value) ]
        ]


-- Sum all available resources for all climate zones
output : Player -> List Produce
output player =
    List.map (outputByClimateZone player) climateZoneTypes


-- Sum available resources in a specific climate zone
outputByClimateZone : Player -> ClimateZoneType -> Produce
outputByClimateZone player zone =
    (zone, List.foldr (\t acc -> acc + outputByResourceType player.resources t zone) 0.0 player.resourceTypes)


-- outputs the maximum output for one resource type in a specific climate zone from a list of resources
outputByResourceType : List NaturalResource -> ResourceType -> ClimateZoneType -> Float
outputByResourceType resources resourceType zone =
    resources
    |> List.filterMap (hasResourceType resourceType)
    |> List.foldr (\r acc -> max (outputByZone r zone) acc) 0.0


-- find the output of one climate zone in one resource
outputByZone : NaturalResource -> ClimateZoneType -> Float
outputByZone resource zone =
    List.foldr (\(z, value) acc -> if z == zone then value else acc) 0.0 resource.produce


-- find all resources that produce a resourceType
resourcesByType : List NaturalResource -> ResourceType -> List NaturalResource
resourcesByType resources resourceType =
    List.filterMap (hasResourceType resourceType) resources


-- Check if a NaturalResource provides a specific ResourceType
hasResourceType : ResourceType -> NaturalResource -> Maybe NaturalResource
hasResourceType resourceType resource =
    if List.member resourceType resource.types then
        Just resource
    else
        Nothing


-- Find the nice output for a climate zone
zoneTranslation : ClimateZoneType -> String
zoneTranslation zoneType =
    case List.filter (\(zt, translation) -> zoneType == zt) climateZones |> List.head of
        Nothing ->
            ""
        Just (zt, translation) ->
            translation
