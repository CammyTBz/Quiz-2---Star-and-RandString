module Star exposing (main, view)
import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Browser
import Dict exposing (update)
type Msg = 
    Like | Unlike

--MODEL - holds the state variable
 
initialStarModel : { liked : Bool }
initialStarModel =
    { 
        
        liked = False
    }

-- type Msg = Like | Unlike


-- view - takes our model and displays it             
viewStarModel : { liked : Bool } -> Html Msg
viewStarModel model = 
    let
        buttonType = 
            if model.liked then "star" else "star_half"
        msg =
            if model.liked then Unlike else Like
    in
    div [class "star_button"] [
        span 
            [ class "material-icons md-100", onClick msg ] 
            [ text buttonType ] 
    ]

view : { liked : Bool } -> Html Msg
view model =
    viewStarModel model

update : Msg -> { liked : Bool } -> { liked : Bool }
update msg model =
    case msg of
        Like ->
            { model | liked = True }
        Unlike ->
            { model | liked = False }

main : Program () {liked: Bool} Msg
main =
    Browser.sandbox
    {
        init = initialStarModel
        ,view = viewStarModel
        , update = update
    }
    


    