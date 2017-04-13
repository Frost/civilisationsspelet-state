module TechnologyList exposing (view)

import Html exposing (Html, ul, li, text, section, h1)
import Types exposing (Player, Technology, Msg)
import Resources exposing (technologies)

view : Player -> Html Msg
view player =
    section []
        [ h1 [] [ text "Teknologier" ]
        , ul [] (List.map item player.technologies)
        ]

item : Technology -> Html Msg
item technology =
    li [] [ text technology.name ]
