module Resources exposing (..)

import Types exposing (..)

resources : List NaturalResource
resources =
    [ { name = "Vete"
      , types = [ Carbohydrate ]
      , produce =
          [ ( SubTropicDry, 0.5 )
          , ( SubTropicMedium, 2.5 )
          , ( TemperedHumid, 1.5 )
          ]
      }
    , { name = "Ris"
      , types = [ Carbohydrate ]
      , produce =
          [ ( TropicMedium, 1.5 )
          , ( SubTropicHumid, 2.5 )
          ]
      }
    , { name = "Bönor"
      , types = [ Protein ]
      , produce =
          [ (SubTropicMedium, 1)
          , (TemperedMedium, 0.5)
          , (TemperedHumid, 1.5)
          ]
      }
    ]

climateZoneTypes : List ClimateZoneType
climateZoneTypes = [ TemperedDry
                   , TemperedMedium
                   , TemperedHumid
                   , SubTropicDry
                   , SubTropicMedium
                   , SubTropicHumid
                   , TropicDry
                   , TropicMedium
                   , TropicHumid
                   ]

climateZones : List ClimateZone
climateZones = [ (TemperedDry, "Tempererat torrt")
               , (TemperedMedium, "Tempererat medel")
               , (TemperedHumid, "Tempererat fuktigt")
               , (SubTropicDry, "Subtropiskt torrt")
               , (SubTropicMedium, "Subtropiskt medel")
               , (SubTropicHumid, "Subtropiskt fuktigt")
               , (TropicDry, "Tropiskt torrt")
               , (TropicMedium, "Tropiskt medel")
               , (TropicHumid, "Tropiskt fuktigt")
               ]

technologies : List Technology
technologies = [ { name = "Hjulet"
                 , id = "wheel"
                 , description = "Möjlighet att använda Muskelkraft"
                 }
               , { name = "Vävning"
                 , id = "weaving"
                 , description = "Möjlighet att använda Textil"
                 }
               ]
