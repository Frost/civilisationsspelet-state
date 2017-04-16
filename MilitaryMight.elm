module MilitaryMight exposing (view)

import Html exposing (Html, dt, dd, text)
import Types exposing (Player, MilitaryBonus, Msg, TechnologyEffect)
import Player exposing (technologyEffects)


view : Player -> List (Html Msg)
view player =
    [ dt [] [ text "Fördel attack" ]
    , dd [] [ text (toString <| offensiveBonus player) ]
    , dt [] [ text "Fördel försvar" ]
    , dd [] [ text (toString <| defensiveBonus player) ]
    ]


-- Private functions


offensiveBonus : Player -> MilitaryBonus
offensiveBonus player =
    List.sum <| militaryBonuses offensiveBonusFromEffect player


defensiveBonus : Player -> MilitaryBonus
defensiveBonus player =
    List.sum <| militaryBonuses defensiveBonusFromEffect player


militaryBonuses : (TechnologyEffect -> Maybe MilitaryBonus) -> Player -> List MilitaryBonus
militaryBonuses fun player =
    List.filterMap fun <| technologyEffects player


offensiveBonusFromEffect : TechnologyEffect -> Maybe MilitaryBonus
offensiveBonusFromEffect effect =
    case effect of
        Types.MilitaryBonus value _ ->
            Just value
        Types.OffensiveBonus value _ ->
            Just value
        _ ->
            Nothing


defensiveBonusFromEffect : TechnologyEffect -> Maybe MilitaryBonus
defensiveBonusFromEffect effect =
    case effect of
        Types.MilitaryBonus value _ ->
            Just value
        Types.DefensiveBonus value _ ->
            Just value
        _ ->
            Nothing
