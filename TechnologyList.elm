module TechnologyList exposing (view, addTechnology, removeTechnology)

import Html exposing (Html, ul, li, text, section, h1, label, input)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import Html.Attributes exposing (type_, checked, for, style)
import Types exposing (Player, Technology, Msg, TechnologyId)
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
    section [style [("flex-grow", "1")]]
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
          [ label [ onMouseOver (displayTechnologyDetail technology.id), onMouseOut displayNoTechnologyDetail ]
                [ input [ type_ "checkbox", checked check, onClick (msg check technology)] []
                , text <| technologyName technology.id
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


technologyName : TechnologyId -> String
technologyName techId =
    let filterById = (\(id, name, _) -> techId == id) in
      case List.head <| List.filter filterById technologyDisplayData of
          Just (_, name, _) ->
              name
          Nothing ->
              ""

displayTechnologyDetail : TechnologyId -> Msg
displayTechnologyDetail technologyId =
    Types.DisplayTechnologyDetail (Just technologyId)

displayNoTechnologyDetail : Msg
displayNoTechnologyDetail =
    Types.DisplayTechnologyDetail Nothing
