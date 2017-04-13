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
initialModel = { resources = []
               , resourceTypes = [ Protein, Carbohydrate ]
               , technologies = []
               }

-- UPDATE

update : Msg -> Model -> Model
update msg model =
    case msg of
        AddResource resource ->
            NaturalResourceList.addResource resource model
        RemoveResource resource ->
            NaturalResourceList.removeResource resource model
        _ ->
            model


-- VIEW

view : Model -> Html Msg
view model =
    body []
        [ ProductionOutput.view model
        , NaturalResourceList.view model
        , TechnologyList.view model
        ]
