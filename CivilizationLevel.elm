module CivilizationLevel exposing (view)

import Html exposing (Html, dt, dd, text)
import Types exposing (Player, CivilizationLevel, Msg, TechnologyEffect)
import Player exposing (technologyEffects)


view : Player -> List (Html Msg)
view player =
    [ dt [] [ text "Civilisering" ]
    , dd [] [ text (toString <| civilizationLevel player) ]
    ]


-- Private functions


civilizationLevel : Player -> CivilizationLevel
civilizationLevel player =
    1 + List.sum (civilizationBonuses player)


civilizationBonuses : Player -> List CivilizationLevel
civilizationBonuses player =
    List.filterMap civilizationLevelFromEffect <| technologyEffects player


civilizationLevelFromEffect : TechnologyEffect -> Maybe CivilizationLevel
civilizationLevelFromEffect effect =
    case effect of
        Types.CivilizationBonus value _ ->
            Just value
        _ ->
            Nothing
