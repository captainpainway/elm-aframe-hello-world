module Main exposing (..)

import Html exposing (..)
import Color exposing (rgb)
import AFrame exposing (scene, entity)
import AFrame.Primitives exposing (box, sky)
import AFrame.Primitives.Attributes exposing (..)
import AFrame.Animations exposing (..)


main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


type alias Model =
    Int

init : ( Model, Cmd Msg )
init =
    ( 0, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []


view : Model -> Html Msg
view model = 
        scene
            []
            [ box 
                [ position 0 1 -8
                , width 2
                , height 2
                , depth 2
                , color (rgb 87 128 193)
                ]
                [ animation
                    [ attribute_ "rotation"
                    , dur 10000
                    , fill "forwards"
                    , to "360 360 360"
                    , easing "linear"
                    , repeat "indefinite"
                    ]
                    []
                ]
            , sky
                [ src "https://c1.staticflickr.com/2/1060/1413494763_4e21f3f119_o.jpg" ]
                []
            ]


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none