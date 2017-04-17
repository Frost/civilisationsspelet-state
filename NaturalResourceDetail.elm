module NaturalResourceDetail exposing (view)

import Html exposing (Html, section, h1, h2, p, text, table, tbody, tr, td, thead, th)
import Html.Attributes exposing (style, colspan)
import Types exposing (..)
import Resources exposing (..)

view : Maybe ResourceId -> Html Msg
view resourceId =
    case resourceId of
        Nothing ->
            section [] []
        Just id ->
            resourceDetailView id


resourceDetailView : ResourceId -> Html Msg
resourceDetailView id =
    case resourceById id of
        Nothing ->
            section [] []
        Just {name, produce} ->
            section []
                [ h1 [] [ text "Information: ", text name ]
                , (outputTable produce)
                -- , table [] [ tbody [] (compactOutputTable <| resourceOutput produce) ]
                ]


outputTable : List Produce -> Html Msg
outputTable produce =
    table []
        [ thead []
              [ th [ colspan 2 ] [ text "Klimatzon" ]
              , th [] [ text "Prod" ]
              ]
        , tbody [] (List.map outputLine <| resourceOutput produce)
        ]

outputLine : Produce -> Html Msg
outputLine (zoneType, value) =
    tr []
        [ td [ style [("background-color", zoneColor zoneType), ("width", "1rem")] ] []
        , td [] [ text <| zoneTranslation zoneType ]
        , td [] [ text <| toString value ]
        ]

--     td [ style [("background-color", zoneColor zoneType)] ] [ text <| toString value]

-- compactOutputTable : List Produce -> List (Html Msg)
-- compactOutputTable produce =
--     [ compactOutputLine <| List.take 3 produce
--     , compactOutputLine <| List.take 3 <| List.drop 3 produce
--     , compactOutputLine <| List.take 3 <| List.drop 6 produce
--     ]


-- compactOutputLine : List Produce -> Html Msg
-- compactOutputLine produce =
--     tr [] (List.map compactOutputCell produce)


-- compactOutputCell : Produce -> Html Msg
-- compactOutputCell (zoneType, value) =
--     td [ style [("background-color", zoneColor zoneType)] ] [ text <| toString value]

resourceOutput : List Produce -> List Produce
resourceOutput produce =
    List.map (produceFromZone produce) climateZoneTypes


produceFromZone : List Produce -> ClimateZoneType -> Produce
produceFromZone produce zoneType =
    List.foldr (\(zt, value) acc -> if zt == zoneType then (zt, value) else acc) (zoneType, 0.0) produce
