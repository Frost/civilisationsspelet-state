import Html exposing (Html, text, table, th, td, thead, tr, tbody)
import Dict exposing (Dict)

main = Html.beginnerProgram
       { model = initialModel
       , update = update
       , view = view
       }

-- MODEL

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


type alias Score = Int
type Msg = Noop
type alias Model = Int

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

initialModel : Model
initialModel = 0

type alias Player = { resources : List NaturalResource
                    , resourceTypes : List ResourceType
                    }

-- UPDATE

update : Msg -> Model -> Model
update _ model = model


-- VIEW

view : Model -> Html Msg
view model =
    table []
        [ thead []
              [ tr []
                    [ th [] [ text "Klimatzon" ]
                    , th [] [ text "Produktion" ]
                    ]
              ]
        , tbody []
            (( output resources [Carbohydrate, Protein] climateZoneTypes )
            |> List.map climateZoneOutputView)
        ]
    -- text (toString (outputByZone resources [ Carbohydrate, Protein ] SubTropicMedium))
-- Render output for a climate zone
climateZoneOutputView : Produce -> Html Msg
climateZoneOutputView (zoneType, value) =
    tr []
        [ td [] [ text (zoneTranslation zoneType) ]
        , td [] [ text (toString value) ]
        ]


-- Sum all available resources for all climate zones
output : List NaturalResource -> List ResourceType -> List ClimateZoneType -> List Produce
output resources resourceTypes zones =
    List.map (outputByClimateZone resources resourceTypes) zones


-- Sum available resources in a specific climate zone
outputByClimateZone : List NaturalResource -> List ResourceType -> ClimateZoneType -> Produce
outputByClimateZone resources availableTypes zone =
    (zone, List.foldr (\t acc -> acc + outputByResourceType resources t zone) 0.0 availableTypes)


-- outputs the maximum output for one resource type in a specific climate zone from a list of resources
outputByResourceType : List NaturalResource -> ResourceType -> ClimateZoneType -> Float
outputByResourceType resources resourceType zone =
    List.filterMap (hasResourceType resourceType) resources
    |> List.foldr (\r acc -> max (outputByZone r zone) acc) 0.0


-- find the output of one climate zone in one resource
outputByZone : NaturalResource -> ClimateZoneType -> Float
outputByZone resource zone = List.foldr (\(z, value) acc -> if z == zone then value else acc) 0.0 resource.produce

-- resourcesByType : List NaturalResource -> ResourceType -> List NaturalResource
-- resourcesByType resources resourceType = List.filter (\r -> List.member resourceType r.types) resources

-- find all resources that produce a resourceType
resourcesByType : List NaturalResource -> ResourceType -> List NaturalResource
resourcesByType resources resourceType = List.filterMap (hasResourceType resourceType) resources

hasResourceType resourceType resource =
    if List.member resourceType resource.types then
        Just resource
    else
        Nothing

zoneTranslation : ClimateZoneType -> String
zoneTranslation zoneType =
    case List.filter (\(zt, translation) -> zoneType == zt) climateZones |> List.head of
        Nothing ->
            ""
        Just (zt, translation) ->
            translation


