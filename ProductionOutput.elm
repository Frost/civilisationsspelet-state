module ProductionOutput exposing (playerOutput, outputTable)

import Types exposing (..)
import Resources exposing (..)
import Html exposing (Html, table, thead, tbody, tr, th, td, text, section, h1)
import Html.Attributes exposing (style, colspan)

playerOutput : Player -> Html Msg
playerOutput {resources, resourceTypes} =
    section []
        [ h1 [] [ text "Produktion" ]
        , outputTable resources resourceTypes
        ]


outputTable : List NaturalResource -> List ResourceType -> Html Msg
outputTable resources resourceTypes =
    table []
        [ thead []
              [ tr []
                    [ th [ colspan 2] [ text "Klimatzon" ]
                    , th [] [ text "Prod" ]
                    ]
              ]
        , tbody []
            ( let produce = List.map (outputByClimateZone resources resourceTypes) climateZoneTypes
              in List.map climateZoneOutputView produce
            )
        ]

-- Render output for a climate zone
climateZoneOutputView : Produce -> Html Msg
climateZoneOutputView (zoneType, value) =
    tr []
        [ td [ style [("background-color", zoneColor zoneType), ("width", "1rem")] ] []
        , td [] [ text (zoneTranslation zoneType) ]
        , td [ style [("text-align", "right")]] [ text (toString value) ]
        ]


-- Sum available resources in a specific climate zone
outputByClimateZone : List NaturalResource -> List ResourceType -> ClimateZoneType -> Produce
outputByClimateZone resources resourceTypes zone =
    (zone, List.foldr (\t acc -> acc + outputByResourceType resources t zone) 0.0 resourceTypes)


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
