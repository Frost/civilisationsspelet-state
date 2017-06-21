module Resources exposing (..)

import Types exposing (..)

resources : List NaturalResource
resources =
    [ { name = "Vete"
      , id = Wheat
      , types = [ Carbohydrate ]
      , produce =
          [ ( SubTropicDry, 0.5 )
          , ( SubTropicMedium, 2.5 )
          , ( TemperedHumid, 1.5 )
          ]
      }
    , { name = "Ris"
      , id = Rice
      , types = [ Carbohydrate ]
      , produce =
          [ ( TropicMedium, 1.5 )
          , ( SubTropicHumid, 2.5 )
          ]
      }
    , { name = "Rörsocker"
      , id = Sugar
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicHumid, 1)
          , (TropicMedium, 2)
          , (SubTropicMedium, 1)
          ]
      }
    , { name = "Majs"
      , id = Corn
      , types = [ Carbohydrate ]
      , produce =
          [ (SubTropicMedium, 2)
          , (SubTropicHumid, 1.5)
          ]
      }
    , { name = "Potatis"
      , id = Potatoe
      , types = [ Carbohydrate ]
      , produce =
          [ (SubTropicHumid, 2)
          , (TemperedHumid, 2)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Havre"
      , id = Oats
      , types = [ Carbohydrate ]
      , produce =
          [ (SubTropicMedium, 1.5)
          , (TemperedHumid, 1)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Kassava"
      , id = Cassava
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicHumid, 1)
          , (TropicMedium, 1.5)
          ]
      }
    , { name = "Råg"
      , id = Rye
      , types = [ Carbohydrate ]
      , produce =
          [ (TemperedMedium, 1.5)
          , (TemperedHumid, 0.5)
          , (TemperedDry, 0.5)
          ]
      }
    , { name = "Durra"
      , id = Durra
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicMedium, 1.5)
          , (SubTropicHumid, 1)
          ]
      }
    , { name = "Jams"
      , id = Yam
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicHumid, 1.5)
          , (TropicMedium, 1)
          ]
      }
    , { name = "Hirs"
      , id = Millet
      , types = [ Carbohydrate ]
      , produce =
          [ (TropicDry, 1.5)
          , (SubTropicMedium, 0.5)
          ]
      }
    , { name = "Lin"
      , id = Linen
      , types = [ Textile ]
      , produce =
          [ (SubTropicMedium, 1)
          , (TemperedHumid, 1.5)
          , (TemperedMedium, 1)
          ]
      }
    , { name = "Hampa"
      , id = Hemp
      , types = [ Textile ]
      , produce =
          [ (TropicHumid, 1)
          , (SubTropicHumid, 1)
          , (TemperedHumid, 1)
          ]
      }
    , { name = "Silke"
      , id = Silk
      , types = [ Textile ]
      , produce =
          [ (SubTropicHumid, 1.5)
          , (SubTropicMedium, 0.5)
          ]
      }
    , { name = "Jute"
      , id = Jute
      , types = [ Textile ]
      , produce =
          [ (TropicHumid, 1)
          , (TropicMedium, 1)
          , (SubTropicHumid, 1)
          ]
      }
    , { name = "Kikärter"
      , id = Chickpeas
      , types = [ Protein ]
      , produce =
          [ (SubTropicHumid, 1)
          , (SubTropicMedium, 1.5)
          ]
      }
    , { name = "Sojabönor"
      , id = SoyBean
      , types = [ Protein ]
      , produce =
          [ (TropicMedium, 1)
          , (SubTropicHumid, 1.5)
          ]
      }
    , { name = "Nöt"
      , id = Beef
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
      , id = Pork
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
      , id = Chicken
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
      , id = WaterBuffalo
      , types = [ Muscle, Protein ]
      , produce =
          [ (TropicHumid, 0.5)
          , (TropicMedium, 1)
          , (SubTropicHumid, 1)
          , (SubTropicMedium, 0.5)
          ]
      }
    , { name = "Llama"
      , id = Llama
      , types = [ Textile, Muscle ]
      , produce =
          [ (SubTropicHumid, 1)
          , (SubTropicDry, 0.5)
          ]
      }
    , { name = "Åsna"
      , id = Donkey
      , types = [ Muscle ]
      , produce =
          [ (TropicMedium, 1)
          , (TropicDry, 1)
          , (SubTropicHumid, 1)
          , (SubTropicMedium, 1.5)
          ]
      }
    , { name = "Bönor"
      , id = Beans
      , types = [ Protein ]
      , produce =
          [ (SubTropicMedium, 1)
          , (TemperedMedium, 0.5)
          , (TemperedHumid, 1.5)
          ]
      }
    , { name = "Bomull"
      , id = Cotton
      , types = [ Textile ]
      , produce =
            [ (TropicMedium, 1.5)
            , (TropicDry, 0.5)
            , (SubTropicMedium, 1)
            ]
      }
    , { name = "Kamel"
      , id = Camel
      , types = [ Muscle, Textile ]
      , produce =
            [ (SubTropicDry, 1.5)
            ]
      }
    , { name = "Elefant"
      , id = Elephant
      , types = [ Muscle ]
      , produce =
            [ (TropicMedium, 1.5)
            , (TropicDry, 1.5)
            ]
      }
    , { name = "Får"
      , id = Sheep
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
      , id = Horse
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

resourceById : ResourceId -> Maybe NaturalResource
resourceById resourceId =
    List.head <| List.filter (\{id} -> id == resourceId) resources

technologyById : TechnologyId -> Maybe Technology
technologyById technologyId =
    List.head <| List.filter (\{id} -> id == technologyId) technologies


climateZoneTypes : List ClimateZoneType
climateZoneTypes =
    [ TropicHumid
    , TropicMedium
    , TropicDry
    , SubTropicHumid
    , SubTropicMedium
    , SubTropicDry
    , TemperedHumid
    , TemperedMedium
    , TemperedDry
    ]


climateZoneTypesByHumidity : List ClimateZoneType
climateZoneTypesByHumidity =
    [ TropicHumid
    , TropicMedium
    , TropicDry
    , SubTropicHumid
    , SubTropicMedium
    , SubTropicDry
    , TemperedHumid
    , TemperedMedium
    , TemperedDry
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


-- technologies : List Technology
technologies =
    [ { id = Metallurgy    , cost = 1, effects = [ (MilitaryBonus 1, None) ] }
    , { id = Irrigation    , cost = 1, effects = [] }
    , { id = Priesthood    , cost = 1, effects = [ (CivilizationBonus 1, None) ] }
    , { id = Writing       , cost = 1, effects = [] }
    , { id = Weaving       , cost = 1, effects = [ (EnableResourceType Textile, None) ] }
    , { id = Wheel         , cost = 1, effects = [ (EnableResourceType Muscle, None) ] }
    , { id = Stirrup       , cost = 2, effects = [ (MilitaryBonusOnLand 1, OneResourceNeeded [ Horse, Elephant, Camel ]) ] }
    , { id = Drama         , cost = 2, effects = [ (CivilizationBonus 2, None) ] }
    , { id = Law           , cost = 2, effects = [ (CivilizationBonus 1, None) ] }
    , { id = Engineering   , cost = 2, effects = [ (DefensiveBonus 1, None) ]}
    , { id = Machines      , cost = 3, effects = [] }
    , { id = Litterature   , cost = 3, effects = [ (CivilizationBonus 1, None) ]}
    , { id = Mathematics   , cost = 3, effects = [] }
    , { id = PlantBreeding , cost = 3, effects = [] }
    , { id = BookReligion  , cost = 3, effects = [] }
    , { id = Philosophy    , cost = 4, effects = [ (CivilizationBonus 1, None) ] }
    , { id = Credit        , cost = 4, effects = [] }
    , { id = BlackPowder   , cost = 4, effects = [ (OffensiveBonus 1, None) ] }
    , { id = BookPress     , cost = 4, effects = [] }
    , { id = Astronomy     , cost = 4, effects = [ (MilitaryBonusAtSea 1, None)] }
    , { id = Nationalism   , cost = 5, effects = [] }
    , { id = Bureaucracy   , cost = 5, effects = [] }
    , { id = Science       , cost = 5, effects = [] }
    , { id = Companies     , cost = 5, effects = [] }
    ]


technologyDisplayData : List TechnologyDetail
technologyDisplayData =
    [ (Astronomy, "Astronomi", "Du kan ha flottor på oceaner. Fördel +1 i havsområden.")
    , (BlackPowder, "Krutvapen", "Krig: Influera 1 mer när du tar kontroll. Fördel +1 anfall.")
    , (BookPress, "Tryckpressen", "Teknologi: Köp 1 mer teknologi som en civ du har handel med känner till. Inflytande: Gör 2 uppror.")
    , (BookReligion, "Bokreligion", "Inflytande: Du kan avinfluera från civilisationer utan Bokreligion för 2 civilisering/inflytande. Uppror +1.")
    , (Bureaucracy, "Byråkrati", "Krig: Avinfluera 1 när du etablerar kontroll. Poäng: Byt 1 kort.")
    , (Companies, "Företag", "Direkt: Sätt ut en ny handelsväg. Handel: Flytta en extra handelsväg.")
    , (Credit, "Kredit", "Direkt: Fördubbla stadens storlek.")
    , (Drama, "Drama", "Civilisering +2.")
    , (Engineering, "Ingenjörskonst", "Monument kostar 1 mindre överskott. Fördel +1 försvar.")
    , (Irrigation, "Konstbevattning", "+1 överskott i områden med en flod.")
    , (Law, "Lag", "Civilisering +1. +1 kort.")
    , (Litterature, "Litteratur", "Direkt: Influera som under en inflytandefas. Civilisering +1.")
    , (Machines, "Maskiner", "Poäng: du får bygga 1 monument.")
    , (Mathematics, "Matematik", "Teknologi: köp 2 teknologier.")
    , (Metallurgy, "Metallredskap", "Fördel + 1")
    , (Nationalism, "Nationalism", "Poäng: 1 vp per område där din civilisation har 3 mer inflytande än nästa civilisation.")
    , (Philosophy, "Filosofi", "Direkt: Köp en teknologi. Civilisering +1.")
    , (PlantBreeding, "Växtförädling", "Natur: Domestisera två gånger.")
    , (Priesthood, "Prästerskap", "Civilisering +1.")
    , (Science, "Vetenskap", "Monument är gratis i teknologifasen. 1 rabatt på teknologier.")
    , (Stirrup, "Stigbygeln", "+1 fördel på land om du har antingen häst, elefant eller kamel. Flytta ett extra steg genom torra områden.")
    , (Weaving, "Vävning", "Överskott från textil")
    , (Wheel, "Hjulet", "Överskott från muskelkraft")
    , (Writing, "Skrivkonst", "1 rabatt på teknologier som en civilisation du är i kontakt med känner till.")
    ]


technologyDetailById : TechnologyId -> Maybe TechnologyDetail
technologyDetailById techId =
    List.head <| List.filter (\(id, _, _) -> techId == id) technologyDisplayData


zoneColors : List ClimateZone
zoneColors = [(TropicHumid, "#a10207")
             , (TropicMedium, "#fa0607")
             , (TropicDry, "#fdb2a7")
             , (SubTropicHumid, "#ff7100")
             , (SubTropicMedium, "#fff911")
             , (SubTropicDry, "#fff87d")
             , (TemperedHumid, "#0c6d16")
             , (TemperedMedium, "#0fb700")
             , (TemperedDry, "#9cfc8e")
             ]

zoneColor : ClimateZoneType -> String
zoneColor zoneType =
    case List.head <| List.filterMap (colorByZone zoneType) zoneColors of
        Just color ->
            color
        Nothing ->
            ""

colorByZone : ClimateZoneType -> ClimateZone -> Maybe String
colorByZone zoneType (zt, color) =
    if zt == zoneType then
        Just color
    else
        Nothing


-- Find the nice output for a climate zone
zoneTranslation : ClimateZoneType -> String
zoneTranslation zoneType =
    case List.filter (\(zt, translation) -> zoneType == zt) climateZones |> List.head of
        Nothing ->
            ""
        Just (zt, translation) ->
            translation

allResourceTypes : List ResourceType
allResourceTypes = [ Carbohydrate
                   , Muscle
                   , Protein
                   , Textile
                   ]

resourceTypeName : ResourceType -> String
resourceTypeName resourceType =
    case resourceType of
        Carbohydrate -> "Kolhydrat"
        Muscle       -> "Muskelkraft"
        Protein      -> "Protein"
        Textile      -> "Textil"

technologiesById : List TechnologyId -> List Technology
technologiesById ids =
    List.filter (\{id} -> List.member id ids) technologies

resourcesById : List ResourceId -> List NaturalResource
resourcesById ids =
    List.filter (\{id} -> List.member id ids) resources
