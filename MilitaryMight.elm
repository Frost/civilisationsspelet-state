module MilitaryMight exposing (view)

import Html exposing (Html, dt, dd, text)
import Types exposing (Player, MilitaryBonus, Msg, TechnologyEffectCondition)
import Player exposing (technologyEffects)


view : Player -> List (Html Msg)
view player =
    [ dt [] [ text "Fördel attack" ]
    , dd [] [ text (toString <| offensiveBonus player) ]
    , dt [] [ text "Fördel försvar" ]
    , dd [] [ text (toString <| defensiveBonus player) ]
    , dt [] [ text "Fördel på land" ]
    , dd [] [ text (toString <| bonusOnLand player) ]
    , dt [] [ text "Fördel till havs" ]
    , dd [] [ text (toString <| bonusAtSea player) ]
    ]


-- Private functions


offensiveBonus : Player -> MilitaryBonus
offensiveBonus player =
    List.sum <| militaryBonuses offensiveBonusFromEffect player


defensiveBonus : Player -> MilitaryBonus
defensiveBonus player =
    List.sum <| militaryBonuses defensiveBonusFromEffect player


bonusOnLand : Player -> MilitaryBonus
bonusOnLand player =
    List.sum <| militaryBonuses militaryBonusOnLandFromEffect player


bonusAtSea : Player -> MilitaryBonus
bonusAtSea player =
    List.sum <| militaryBonuses militaryBonusAtSeaFromEffect player

militaryBonuses : (TechnologyEffectCondition -> Maybe MilitaryBonus) -> Player -> List MilitaryBonus
militaryBonuses fun player =
    List.filterMap fun <| technologyEffects player


offensiveBonusFromEffect : TechnologyEffectCondition -> Maybe MilitaryBonus
offensiveBonusFromEffect (effect, _) =
    case effect of
        Types.MilitaryBonus value ->
            Just value
        Types.OffensiveBonus value ->
            Just value
        _ ->
            Nothing


defensiveBonusFromEffect : TechnologyEffectCondition -> Maybe MilitaryBonus
defensiveBonusFromEffect (effect, _) =
    case effect of
        Types.MilitaryBonus value ->
            Just value
        Types.DefensiveBonus value ->
            Just value
        _ ->
            Nothing


militaryBonusOnLandFromEffect : TechnologyEffectCondition -> Maybe MilitaryBonus
militaryBonusOnLandFromEffect (effect, _) =
    case effect of
        Types.MilitaryBonus value ->
            Just value
        Types.MilitaryBonusOnLand value ->
            Just value
        _ ->
            Nothing


militaryBonusAtSeaFromEffect : TechnologyEffectCondition -> Maybe MilitaryBonus
militaryBonusAtSeaFromEffect (effect, _) =
    case effect of
        Types.MilitaryBonus value ->
            Just value
        Types.MilitaryBonusAtSea value ->
            Just value
        _ ->
            Nothing
