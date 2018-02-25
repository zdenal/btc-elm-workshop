module Main exposing (..)

import Html
import List
import Sha256 exposing (sha256)


type alias Block =
    { index : Int
    , timestamp : String
    , data : String
    , previousHash : String
    , hash : String
    , puzzle : String
    , nonce : Int
    }


type alias BlockChain =
    List Block


createHash : Int -> Int -> String -> String -> String -> String
createHash index nonce data previousHash timestamp =
    toString index
        |> String.append (toString nonce)
        |> String.append data
        |> String.append previousHash
        |> String.append timestamp
        |> sha256


pow : String -> String -> Int -> Int -> String -> Block
pow data puzzle nonce index prevHash =
    let
        timestamp =
            "1/1/2017"

        suggestedHash =
            createHash index nonce data prevHash timestamp
    in
    if String.startsWith puzzle suggestedHash then
        Block index timestamp data prevHash suggestedHash puzzle nonce
    else
        pow data puzzle (nonce + 1) index prevHash


mineBlock : String -> String -> BlockChain -> Block
mineBlock data puzzle chain =
    let
        ( index, prevHash ) =
            case List.head chain of
                Just { index, hash } ->
                    ( index + 1, hash )

                Nothing ->
                    ( 0, "" )
    in
    pow data puzzle 0 index prevHash


addDataToChain : String -> String -> BlockChain -> BlockChain
addDataToChain data puzzle chain =
    mineBlock data puzzle chain :: chain


main =
    let
        blockChain =
            []

        currentPuzzle =
            "000"
    in
    blockChain
        |> addDataToChain "genesis" currentPuzzle
        |> addDataToChain "zdenal" currentPuzzle
        |> addDataToChain "laco" currentPuzzle
        |> addDataToChain "david" currentPuzzle
        |> toString
        |> Html.text
