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

type Msg = Noop

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
type alias Model = Player

type alias Technology = { name : String
                        , id : String
                        , description : String
                        }
