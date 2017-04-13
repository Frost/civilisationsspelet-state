import Html exposing (Html, body)
import Types exposing (..)
import Resources exposing (resources)
import ProductionOutput
import NaturalResourceList
import TechnologyList

main = Html.beginnerProgram
       { model = initialModel
       , update = update
       , view = view
       }

-- MODEL


initialModel : Model
initialModel = { resources = resources
               , resourceTypes = [ Protein, Carbohydrate ]
               , technologies = []
               }

-- UPDATE

update : Msg -> Model -> Model
update _ model = model


-- VIEW

view : Model -> Html Msg
view model =
    body []
        [ ProductionOutput.view model
        , NaturalResourceList.view model
        , TechnologyList.view model
        ]
