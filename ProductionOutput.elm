-- module ProductionOutput exposing (playerOutput, outputTable)
module ProductionOutput exposing (..)

import Maybe exposing (andThen)

import Types exposing (..)
import Resources exposing (..)
import Player exposing (resourceTypes)
import Html exposing (Html, table, thead, tbody, tfoot, tr, th, td, text, section, h1, div, ul, li, h2)
import Html.Attributes exposing (style, colspan)

-- playerOutput : Player -> Html Msg
-- playerOutput {resources, resourceTypes} =
--     section []
--         [ h1 [] [ text "Produktion" ]
--         , outputTable resources resourceTypes Nothing
--         ]

output : Model -> Html Msg
output {player, displayTechnology, displayResource} =
    let
        newTechs = case displayTechnology |> andThen technologyById of
                       Nothing ->
                           player.technologies
                       Just technology ->
                           if List.member technology player.technologies then
                               player.technologies
                            else
                                technology :: player.technologies

        newResources = case displayResource |> andThen resourceById of
                           Nothing ->
                               player.resources
                           Just resource ->
                               if List.member resource player.resources then
                                   player.resources
                               else
                                   resource :: player.resources

        newResourceTypes = Player.resourceTypes {player | technologies = newTechs, resources = newResources}
        diffProduce = List.map (outputByClimateZone newResources newResourceTypes) climateZoneTypes
        produce = List.map (outputByClimateZone player.resources player.resourceTypes) climateZoneTypes
        resource = displayResource |> andThen resourceById
        newProduce = climateZoneOutput resource
     in
    section []
        [ h1 [] [ text "Produktion" ]
        , table []
            [ thead []
                  [ tr []
                        [ th [ colspan 2] [ text "Klimatzon" ]
                        , th [] [ text "Prod" ]
                        , outputTableDetailHead displayResource
                        ]
                  ]
            , tbody []
                (allClimateZonesOutputWithDiff produce newProduce diffProduce)
            , tfoot []
                [ tr []
                      [ td [] [ text "Från:" ]
                      , td [colspan 2]
                          [ ul []
                                (List.map (\resourceType -> li [] [ text <| resourceTypeName resourceType] ) player.resourceTypes )]
                      , (displayResourceFooter displayResource)
                      ]
                ]
            ]
        ]


outputTable : List NaturalResource -> List ResourceType -> Maybe ResourceId -> Html Msg
outputTable resources resourceTypes resourceDetail =
    table []
        [ thead []
              [ tr []
                    [ th [ colspan 2] [ text "Klimatzon" ]
                    , th [] [ text "Prod" ]
                    , outputTableDetailHead resourceDetail
                    ]
              ]
        , tbody []
            ( let
                produce = List.map (outputByClimateZone resources resourceTypes) climateZoneTypes
              in
                  List.map climateZoneOutputView produce
            )
        ]

outputTableDetailHead : Maybe ResourceId -> Html Msg
outputTableDetailHead resource =
    case resource |> andThen resourceById of
        Nothing ->
            text ""
        Just resource ->
            th [] [ text resource.name ]

displayResourceFooter : Maybe ResourceId -> Html Msg
displayResourceFooter resource =
    case resource |> andThen resourceById of
        Nothing ->
            text ""
        Just resource ->
            td [ colspan 2 ]
                [ ul []
                      (List.map (\resourceType -> li [] [ text <| resourceTypeName resourceType] ) resource.types )]


allClimateZonesOutputWithDiff : List Produce -> List Produce -> List Produce -> List (Html Msg)
allClimateZonesOutputWithDiff produce newProduce diffProduce =
    case (produce, newProduce, diffProduce) of
        (p :: rest, (_, newValue) :: nRest, (_, diffValue) :: dRest) ->
            climateZoneOutputViewWithDiff p newValue diffValue :: allClimateZonesOutputWithDiff rest nRest dRest
        _ ->
            []

-- Render output for a climate zone
climateZoneOutputView : Produce -> Html Msg
climateZoneOutputView (zoneType, value) =
    tr []
        [ td [ style [("background-color", zoneColor zoneType), ("width", "1rem")] ] []
        , td [] [ text (zoneTranslation zoneType) ]
        , td [ style [("text-align", "right")]] [ text (toString value) ]
        ]

climateZoneOutputViewWithDiff : Produce -> Float -> Float -> Html Msg
climateZoneOutputViewWithDiff (zoneType, value) newValue diffValue =
    let
        newValueText = if newValue > 0 then
                           text <| toString newValue
                       else
                           text ""
        diff = diffValue - value
        diffText = if diff > 0 then
                       [ text " (+ "
                       , text <| toString diff
                       , text ")"
                       ]
                   else
                       [text ""]
    in
        tr []
            [ td [ style [("background-color", zoneColor zoneType), ("width", "1rem")] ] []
            , td [] [ text (zoneTranslation zoneType) ]
            , td [ style [("text-align", "right")]] [ text <| toString value  ]
            , td [ style [("text-align", "right")]] [ newValueText ]
            , td [ style [("text-align", "right")]] diffText
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

-- ta in en [Produce] och en resurs, generera
-- (ClimateZoneType, Float,        Float,            Float)
-- (TropicHumid,     currentValue, newResourceValue, diff)
-- resourceOutputTable : List Produce -> NaturalResource -> List (Html Msg)
-- resourceOutputTable produce resource =
--     let

-- produceList : NaturalResource -> List Produce
-- produceList resource
