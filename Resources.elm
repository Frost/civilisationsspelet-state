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
    , { name = "Rörsocker"
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicHumid, 1)
          , (TropicMedium, 2)
          , (SubTropicMedium, 1)
          ]
      }
    , { name = "Majs"
      , types = [ Carbohydrate ]
      , produce =
          [ (SubTropicMedium, 2)
          , (SubTropicHumid, 1.5)
          ]
      }
    , { name = "Potatis"
      , types = [ Carbohydrate ]
      , produce =
          [ (SubTropicHumid, 2)
          , (TemperedHumid, 2)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Havre"
      , types = [ Carbohydrate ]
      , produce =
          [ (SubTropicMedium, 1.5)
          , (TemperedHumid, 1)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Kassava"
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicHumid, 1)
          , (TropicMedium, 1.5)
          ]
      }
    , { name = "Råg"
      , types = [ Carbohydrate ]
      , produce =
          [ (TemperedMedium, 1.5)
          , (TemperedHumid, 0.5)
          , (TemperedDry, 0.5)
          ]
      }
    , { name = "Durra"
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicMedium, 1.5)
          , (SubTropicHumid, 1)
          ]
      }
    , { name = "Jams"
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicHumid, 1.5)
          , (TropicMedium, 1)
          ]
      }
    , { name = "Hirs"
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicDry, 1.5)
          , (SubTropicMedium, 0.5)
          ]
      }
    , { name = "Lin"
      , types = [ Textile ]
      , produce =
          [ (SubTropicMedium, 1)
          , (TemperedHumid, 1.5)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Hampa"
      , types = [ Textile ]
      , produce =
          [ (TropicHumid, 1)
          , (SubTropicHumid, 1)
          , (TemperedHumid, 1)
          ]
      }
    , { name = "Silke"
      , types = [ Textile ]
      , produce =
          [ (SubTropicHumid, 1.5)
          , (SubTropicMedium, 0.5)
          ]
      }
    , { name = "Jute"
      , types = [ Textile ]
      , produce =
          [ (TropicHumid, 1)
          , (TropicMedium, 1)
          , (SubTropicHumid, 1)
          ]
      }
    , { name = "Kikärter"
      , types = [ Protein ]
      , produce =
          [ (SubTropicHumid, 1)
          , (SubTropicMedium, 1.5)
          ]
      }
    , { name = "Sojabönor"
      , types = [ Protein ]
      , produce =
          [ (TropicMedium, 1)
          , (SubTropicHumid, 1.5)
          ]
      }
    , { name = "Nöt"
      , types = [ Protein, Muscle ]
      , produce =
          [ (TropicDry, 0.5)
          , (SubTropicHumid, 0.5)
          , (SubTropicHumid, 0.5)
          , (SubTropicMedium, 1)
          , (TemperedHumid, 1)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Svin"
      , types = [ Protein ]
      , produce =
          [ (TropicHumid, 1.5)
          , (TropicMedium, 1)
          , (SubTropicHumid, 1)
          , (SubTropicMedium, 1)
          , (TemperedHumid, 1)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Höns"
      , types = [ Protein ]
      , produce =
            [ (TropicHumid, 1)
            , (TropicMedium, 1.5)
            , (SubTropicHumid, 1)
            , (SubTropicMedium, 1)
            , (TemperedHumid, 1)
            , (TemperedMedium, 1)
            ]
      }
    , { name = "Vattenbuffel"
      , types = [ Muscle, Protein ]
      , produce =
          [ (TropicHumid, 0.5)
          , (TropicMedium, 1)
          , (SubTropicHumid, 1)
          , (SubTropicMedium, 0.5)
          ]
      }
    , { name = "Llama"
      , types = [ Textile, Muscle ]
      , produce =
          [ (SubTropicHumid, 1)
          , (SubTropicDry, 0.5)
          ]
      }
    , { name = "Åsna"
      , types = [ Muscle ]
      , produce =
          [ (TropicMedium, 1)
          , (TropicDry, 1)
          , (SubTropicHumid, 1)
          , (SubTropicMedium, 1.5)
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
    , { name = "Bomull"
      , types = [ Textile ]
      , produce =
            [ (TropicMedium, 1.5)
            , (TropicDry, 0.5)
            , (SubTropicMedium, 1)
            ]
      }
    , { name = "Kamel"
      , types = [ Muscle, Textile ]
      , produce =
            [ (SubTropicDry, 1.5)
            ]
      }
    , { name = "Elefant"
      , types = [ Muscle ]
      , produce =
            [ (TropicMedium, 1.5)
            , (TropicDry, 1.5)
            ]
      }
    , { name = "Får"
      , types = [ Textile, Protein ]
      , produce =
            [ (TropicDry, 0.5)
            , (SubTropicMedium, 0.5)
            , (TemperedDry, 1)
            , (TemperedMedium, 1)
            , (TemperedHumid, 1)
            ]
      }
    , { name = "Häst"
      , types = [ Muscle, Protein ]
      , produce =
            [ (TropicDry, 1)
            , (SubTropicMedium, 1)
            , (SubTropicDry, 0.5)
            , (TemperedHumid, 0.5)
            , (TemperedDry, 1.5)
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
technologies = [ { id = Astronomy
                 , effects = []
                 }
               , { id = BlackPowder
                 , effects = [ OffensiveBonus 1 ]
                 }
               , { id = BookPress
                 , effects = []
                 }
               , { id = BookReligion
                 , effects = []
                 }
               , { id = Bureaucracy
                 , effects = []
                 }
               , { id = Companies
                 , effects = []
                 }
               , { id = Credit
                 , effects = []
                 }
               , { id = Drama
                 , effects = [ CivilizationBonus 2 ]
                 }
               , { id = Engineering
                 , effects = [ DefensiveBonus 1 ]
                 }
               , { id = Irrigation
                 , effects = []
                 }
               , { id = Law
                 , effects = [ CivilizationBonus 1 ]
                 }
               , { id = Litterature
                 , effects = [ CivilizationBonus 1 ]
                 }
               , { id = Machines
                 , effects = []
                 }
               , { id = Mathematics
                 , effects = []
                 }
               , { id = MetalTooling
                 , effects = [ MilitaryBonus 1 ]
                 }
               , { id = Nationalism
                 , effects = []
                 }
               , { id = Philosophy
                 , effects = [ CivilizationBonus 1 ]
                 }
               , { id = PlantBreeding
                 , effects = []
                 }
               , { id = Priesthood
                 , effects = [ CivilizationBonus 1 ]
                 }
               , { id = Science
                 , effects = []
                 }
               , { id = Weaving
                 , effects = [ EnableResourceType Textile ]
                 }
               , { id = Wheel
                 , effects = [ EnableResourceType Muscle ]
                 }
               , { id = Writing
                 , effects = []
                 }
               ]

  -- technologies = [ { name = "Hjulet"
  --                 , description = "Möjlighet att använda Muskelkraft"
  --                 , effects = [ EnableResourceType Muscle ]
  --                 }
  --               , { name = "Vävning"
  --                 , description = "Möjlighet att använda Textil"
  --                 , effects = [ EnableResourceType Textile ]
  --                 }
  --               , { name = "Prästerskap"
  --                 , description = "Civilisering + 1"
  --                 , effects = [ CivilizationBonus 1 ]
  --                 }
  --               , { name = "Metallredskap"
  --                 , description = "Fördel + 1"
  --                 , effects = [ MilitaryBonus 1 ]
  --                 }
  --               , { name = "Konstbevattning"
  --                 , description = "Överskott + 1 i områden med en flod"
  --                 , effects = [] -- TODO: Implement
  --                 }
  --               , { name = "Skrivkonst"
  --                 , description = "1 rabatt på teknologier som en civilisation du är i kontakt med känner till"
  --                 , effects = [] -- TODO: Implement
  --                 }
  --               ]

technologyDisplayData : List TechnologyDetail
technologyDisplayData =
    [ (Astronomy, "Astronomi", "Du kan ha flottor på oceaner. Fördel +1 i havsområden.")
    , (BlackPowder, "Krutvapen", "Krig: Influera 1 mer när du tar kontroll. Fördel +1 anfall.")
    , (BookPress, "Tryckpressen", "Teknologi: Köp 1 mer teknologi som en civ du har handel med känner till. Inflytande: Gör 2 uppror.")
    , (BookReligion, "Bokreligion", "Inflytande: Du kan avinfluera från civilisationer utan Bokreligion för 2 civilisering/inflytande. Uppror +1.")
    , (Bureaucracy, "Byråkrati", "Krig: Avinfluera 1 när du etablerar kontroll. Poäng: Byt 1 kort.")
    , (Companies, "Företag", "Direkt: Sätt ut en ny handelsväg. Handel: Flytta en extra handelsväg.")
    , (Drama, "Drama", "Civilisering +2.")
    , (Engineering, "Ingenjörskonst", "Monument kostar 1 mindre överskott. Fördel +1 försvar.")
    , (Irrigation, "Konstbevattning", "+1 överskott i områden med en flod.")
    , (Law, "Lag", "Civilisering +1. +1 kort.")
    , (Litterature, "Litteratur", "Direkt: Influera som under en inflytandefas. Civilisering +1.")
    , (Machines, "Maskiner", "Poäng: du får bygga 1 monument.")
    , (Mathematics, "Matematik", "Teknologi: köp 2 teknologier.")
    , (MetalTooling, "Metallredskap", "Fördel + 1")
    , (Nationalism, "Nationalism", "Poäng: 1 vp per område där din civilisation har 3 mer inflytande än nästa civilisation.")
    , (Philosophy, "Filosofi", "Direkt: Köp en teknologi. Civilisering +1.")
    , (PlantBreeding, "Växtförädling", "Natur: Domestisera två gånger.")
    , (Priesthood, "Prästerskap", "Civilisering +1.")
    , (Science, "Vetenskap", "Monument är gratis i teknologifasen. 1 rabatt på teknologier.")
    , (Weaving, "Vävning", "Överskott från textil")
    , (Wheel, "Hjulet", "Överskott från muskelkraft")
    , (Writing, "Skrivkonst", "1 rabatt på teknologier som en civilisation du är i kontakt med känner till.")
    ]
