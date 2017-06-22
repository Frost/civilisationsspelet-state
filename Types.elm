module Types exposing (..)

type ResourceType = Textile
                  | Muscle
                  | Protein
                  | Carbohydrate


type ClimateZoneType = TemperedHumid
                     | TemperedMedium
                     | TemperedDry
                     | SubTropicHumid
                     | SubTropicMedium
                     | SubTropicDry
                     | TropicHumid
                     | TropicMedium
                     | TropicDry


type TechnologyRequirements = OneResourceNeeded (List ResourceId)
                            | None

type TechnologyEffect = EnableResourceType ResourceType
                        | CivilizationBonus Int
                        | OffensiveBonus Int
                        | DefensiveBonus Int
                        | MilitaryBonus Int
                        | MilitaryBonusOnLand Int
                        | MilitaryBonusAtSea Int

type alias TechnologyEffectCondition = (TechnologyEffect, TechnologyRequirements)

type ResourceId = Beans
                | Beef
                | Camel
                | Cassava
                | Chicken
                | Chickpeas
                | Corn
                | Cotton
                | Donkey
                | Durra
                | Elephant
                | Hemp
                | Horse
                | Jute
                | Linen
                | Llama
                | Millet -- Hirs
                | Oats
                | Pork
                | Potatoe
                | Rice
                | Rye
                | Sheep
                | Silk
                | SoyBean
                | Sugar
                | WaterBuffalo
                | Wheat
                | Yam

type TechnologyId = Astronomy
                  | BlackPowder
                  | BookPress
                  | BookReligion
                  | Bureaucracy
                  | Companies
                  | Credit
                  | Drama
                  | Engineering
                  | Irrigation
                  | Law
                  | Litterature
                  | Machines
                  | Mathematics
                  | Metallurgy
                  | Nationalism
                  | Philosophy
                  | PlantBreeding
                  | Priesthood
                  | Science
                  | Stirrup
                  | Weaving
                  | Wheel
                  | Writing

type alias ClimateZone = (ClimateZoneType, String)

type alias Produce = ( ClimateZoneType, Float )

type alias NaturalResource = { name : String
                             , id : ResourceId
                             , types : List ResourceType
                             , produce : List Produce
                             }

type alias Player = { resources : List NaturalResource
                    , resourceTypes : List ResourceType
                    , technologies : List Technology
                    }

type alias SerializablePlayer = { resources : List ResourceId
                                , resourceTypes : List ResourceType
                                , technologies : List TechnologyId
                                }

type alias Score = Int
type alias CivilizationLevel = Int
type alias MilitaryBonus = Int
type alias Model = { player : Player
                   , displayTechnology : Maybe TechnologyId
                   , displayResource : Maybe ResourceId
                   }

type alias Technology = { id : TechnologyId
                        , cost : Int
                        , effects : List TechnologyEffectCondition
                        , requirements : List TechnologyId
                        , provides : List TechnologyId
                        }


type alias TechnologyDetail = (TechnologyId, String, String)


type Msg = AddResource NaturalResource
         | RemoveResource NaturalResource
         | AddTechnology Technology
         | RemoveTechnology Technology
         | DisplayTechnologyDetail (Maybe TechnologyId)
         | DisplayResourceDetail (Maybe ResourceId)
         | LoadState String
         | ClearState
         | Noop
