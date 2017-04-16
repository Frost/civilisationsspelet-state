module Types exposing (..)

type ResourceType = Textile
                  | Muscle
                  | Protein
                  | Carbohydrate

type ClimateZoneType = TemperedDry 
                     | TemperedMedium
                     | TemperedHumid
                     | SubTropicDry
                     | SubTropicMedium
                     | SubTropicHumid
                     | TropicDry
                     | TropicMedium
                     | TropicHumid


type TechnologyEffectCondition = ResourceNeeded List ResourceId


type alias TechnologyRequirements = List TechnologyEffectCondition
type TechnologyEffect = EnableResourceType ResourceType TechnologyRequirements
                      | CivilizationBonus Int TechnologyRequirements
                      | OffensiveBonus Int TechnologyRequirements
                      | DefensiveBonus Int TechnologyRequirements
                      | MilitaryBonus Int TechnologyRequirements

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
                  | MetalTooling
                  | Nationalism
                  | Philosophy
                  | PlantBreeding
                  | Priesthood
                  | Science
                  | Weaving
                  | Wheel
                  | Writing

type alias ClimateZone = (ClimateZoneType, String)

type alias Produce = ( ClimateZoneType, Float )

type alias NaturalResource = { name : String
                             , types : List ResourceType
                             , produce : List Produce
                             }

type alias Player = { resources : List NaturalResource
                    , resourceTypes : List ResourceType
                    , technologies : List Technology
                    }

type alias Score = Int
type alias CivilizationLevel = Int
type alias MilitaryBonus = Int
type alias Model = { player : Player
                   , displayTechnology : Maybe TechnologyId
                   }

-- type Technology = Technology TechnologyId List TechnologyEffect
type alias Technology = { id : TechnologyId
                        , effects : List TechnologyEffect
                        }


type alias TechnologyDetail = (TechnologyId, String, String)


type Msg = AddResource NaturalResource
         | RemoveResource NaturalResource
         | AddTechnology Technology
         | RemoveTechnology Technology
         | DisplayTechnologyDetail (Maybe TechnologyId)
         | Noop
