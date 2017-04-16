module TechnologyList exposing (view, addTechnology, removeTechnology)

import Html exposing (Html, ul, li, text, section, h1, label, input)
import Html.Events exposing (onClick)
import Html.Attributes exposing (type_, checked, for)
import Types exposing (Player, Technology, Msg)
import Resources exposing (technologies, technologyDisplayData)

addTechnology : Technology -> Player -> Player
addTechnology technology player =
    let newTechnologies = player.technologies ++ [technology] in
      {player | technologies = newTechnologies}


removeTechnology : Technology -> Player -> Player
removeTechnology technology player =
    let newTechnologies = List.filter (\t -> t /= technology) player.technologies in
      {player | technologies = newTechnologies}

view : Player -> Html Msg
view player =
    section []
        [ h1 [] [ text "Teknologier" ]
        , ul [] (items player)
        ]


items : Player -> List (Html Msg)
items player =
    List.map (item player) technologies


item : Player -> Technology -> Html Msg
item player technology =
    let check = hasTechnology technology player in
      li []
          [ label []
                [ input [ type_ "checkbox", checked check, onClick (msg check technology)] []
                , text technology.name
                ]
          ]


hasTechnology : Technology -> Player -> Bool
hasTechnology technology player =
    List.member technology player.technologies


msg : Bool -> Technology -> Msg
msg playerHasTechnology technology =
    if playerHasTechnology then
        Types.RemoveTechnology technology
    else
        Types.AddTechnology technology
