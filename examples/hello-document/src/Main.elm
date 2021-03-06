module Main exposing (main)

import Browser exposing (Document)
import Burrito.Update exposing (..)
import Burrito.Update.Browser exposing (document)
import Html exposing (..)
import Html.Events exposing (..)


type Msg
    = ButtonClicked


type alias Model =
    { message : String
    }


setMessage : String -> Model -> Update Model msg a
setMessage message model =
    save { model | message = message }


init : () -> Update Model Msg a
init () =
    save Model
        |> andMap (save "Nothing much going on here.")


update : Msg -> Model -> Update Model Msg a
update msg =
    case msg of
        ButtonClicked ->
            setMessage "The button was clicked!"


view : Model -> Document Msg
view { message } =
    { title = ""
    , body =
        [ div []
            [ text message
            ]
        , div []
            [ button [ onClick ButtonClicked ] [ text "Click me" ]
            ]
        ]
    }


main : Program () Model Msg
main =
    document
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }
