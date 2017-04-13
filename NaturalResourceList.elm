module NaturalResourceList exposing (view)

import Html exposing (Html, ul, li, text, section, h1)
import Types exposing (Player, NaturalResource, Msg)
import Resources exposing (resources)

view : Player -> Html Msg
view player =
    section []
        [ h1 [] [ text "Grödor" ]
        , ul [] (List.map item player.resources)
        ]

item : NaturalResource -> Html Msg
item resource =
    li [] [ text resource.name ]
