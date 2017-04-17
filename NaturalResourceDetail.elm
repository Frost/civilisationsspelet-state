module NaturalResourceDetail exposing (view, resourceItemList)

import Html exposing (Html, section, h1, h2, p, text, table, tbody, tr, td, thead, th, ul, li)
import Html.Attributes exposing (style, colspan)
import Types exposing (..)
import Resources exposing (..)
import ProductionOutput exposing (outputTable)

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
        Just resource ->
            section []
                [ h1 [] [ text "Information: ", text resource.name ]
                , (resourceItemList resource.types)
                , (outputTable [resource] allResourceTypes)
                ]

resourceItemList : List ResourceType -> Html Msg
resourceItemList types =
    ul [] (List.map resourceTypeItem types)


resourceTypeItem : ResourceType -> Html Msg
resourceTypeItem resourceType =
    li [] [ text <| resourceTypeName resourceType ]
