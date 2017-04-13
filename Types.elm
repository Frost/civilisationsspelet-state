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

type alias ClimateZone = (ClimateZoneType, String)

type alias Produce = ( ClimateZoneType, Float )

type alias NaturalResource = { name : String
                             , types : List ResourceType
                             , produce : List Produce
                             }

type alias Player = { resources : List NaturalResource
                    , resourceTypes : List ResourceType
                    }

type alias Score = Int
type Msg = Noop
type alias Model = Player
