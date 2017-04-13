import Html exposing (Html)
import Dict exposing (Dict)
import Types exposing (..)
import Resources exposing (..)
import ProductionOutput exposing (productionOutputTable)

main = Html.beginnerProgram
       { model = initialModel
       , update = update
       , view = view
       }

-- MODEL


initialModel : Model
initialModel = { resources = resources
               , resourceTypes = [ Protein, Carbohydrate ]
               }

-- UPDATE

update : Msg -> Model -> Model
update _ model = model


-- VIEW

view : Model -> Html Msg
view model =
    productionOutputTable model
