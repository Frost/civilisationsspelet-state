module PlayerStatus exposing (view)

import Html exposing (Html, section, h1, dl, text, dt)
import Types exposing (Player, Msg)
import NaturalResourceDetail exposing (resourceItemList)
import CivilizationLevel
import MilitaryMight

view : Player -> Html Msg
view player =
  section []
  [ h1 [] [ text "Överblick" ]
  , dl []
      (List.concat [ CivilizationLevel.view player
                   , MilitaryMight.view player
                   ,   [ dt [] [ text "Kan dra nytta av" ]
                       , (resourceItemList player.resourceTypes)
                       ]
                   ]
      )
  ]
