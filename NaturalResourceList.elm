module NaturalResourceList exposing (view)

import Html exposing (Html, ul, li, text, section, h1, input, label)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import Html.Attributes exposing (type_, checked, for, style)
import Types exposing (Player, NaturalResource, Msg)
import Resources exposing (resources)

view : Player -> Html Msg
view player =
    section [ style [("flex-grow", "0")]]
        [ h1 [] [ text "Grödor" ]
        , ul [] (items player)
        ]

items : Player -> List (Html Msg)
items player =
    List.map (item player) <| List.sortBy (\{name} -> name) resources


item : Player -> NaturalResource -> Html Msg
item player resource =
  let check = hasResource resource player in
    li [ style [("width", "100%")] ]
      [ label [ style [("width", "100%"), ("height", "100%")], onMouseOver (displayResourceDetail resource.id), onMouseOut (displayNoResourceDetail) ]
        [ input [ type_ "checkbox", checked check, onClick (msg check resource) ] []
        , text resource.name
        ]
      ]


hasResource : NaturalResource -> Player -> Bool
hasResource resource player =
    List.member resource player.resources


msg : Bool -> NaturalResource -> Msg
msg playerHasResource resource =
    if playerHasResource then
        Types.RemoveResource resource
    else
        Types.AddResource resource


displayResourceDetail : Types.ResourceId -> Msg
displayResourceDetail resourceId =
    Types.DisplayResourceDetail (Just resourceId)


displayNoResourceDetail : Msg
displayNoResourceDetail =
    Types.DisplayResourceDetail Nothing
