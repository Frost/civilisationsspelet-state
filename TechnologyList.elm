module TechnologyList exposing (view, addTechnology, removeTechnology)

import Html exposing (Html, ul, li, text, section, h1, label, input, span)
import Html.Events exposing (onClick, onMouseOver, onMouseOut)
import Html.Attributes exposing (type_, checked, for, style, disabled)
import Types exposing (Player, Technology, Msg, TechnologyId)
import Resources exposing (technologies, technologyDisplayData, technologyName)

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
        [ h1 [] [ text "Teknologier (kostnad)" ]
        , ul [] (items player)
        ]


items : Player -> List (Html Msg)
items player =
    List.map (item player) technologies


item : Player -> Technology -> Html Msg
item player technology =
    let
        check = hasTechnology technology player
        isDisabled = technologyIsUnavailable technology player
    in
      li []
          [ label [ onMouseOver (displayTechnologyDetail technology.id), onMouseOut displayNoTechnologyDetail ]
                [ input [ type_ "checkbox", checked check, onClick (msg check technology), disabled isDisabled] []
                , span [ style [("color", displayColor isDisabled)] ]
                    [ text <| technologyName technology.id
                    , text " ("
                    , text <| toString <| cost technology <| playerTechnologyIds player
                    , text ")"
                    ]
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


displayTechnologyDetail : TechnologyId -> Msg
displayTechnologyDetail technologyId =
    Types.DisplayTechnologyDetail (Just technologyId)

displayNoTechnologyDetail : Msg
displayNoTechnologyDetail =
    Types.DisplayTechnologyDetail Nothing

-- The cost of a technology is its base cost plus 2 per missing requirement
cost : Technology -> List TechnologyId -> Int
cost technology knownTechnologies =
    let missingTechnologies = List.filter (\id -> not <| List.member id knownTechnologies) technology.requirements in
    technology.cost + 2 * (List.length missingTechnologies)

-- A technology is available if it has no requirements or if at least one of its requirements is known
technologyIsUnavailable : Technology -> Player -> Bool
technologyIsUnavailable technology player =
    case List.length(technology.requirements) of
        0 ->
            False
        _ ->
            List.length(knownRequirements player technology) == 0

technologyProvides : Technology -> TechnologyId -> Bool
technologyProvides technology wantedTechnology = List.member wantedTechnology technology.provides

playerTechnologyIds : Player -> List TechnologyId
playerTechnologyIds player = List.map (\{id} -> id) player.technologies

knownRequirements : Player -> Technology -> List TechnologyId
knownRequirements player {requirements} =
    List.filter (\id -> List.member id <| playerTechnologyIds player) requirements

missingRequirements : Player -> Technology -> List TechnologyId
missingRequirements player {requirements} =
    List.filter (\id -> not <| List.member id <| playerTechnologyIds player) requirements

displayColor : Bool -> String
displayColor isDisabled =
    case isDisabled of
        True -> "gray"
        False -> "black"
