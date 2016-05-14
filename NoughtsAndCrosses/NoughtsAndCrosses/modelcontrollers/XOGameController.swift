//
//  XOGameController.swift
//  NoughtsAndCrosses
//
//  Created by Julian Hulme on 2016/05/09.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import Foundation

public enum position : Int {
    
    case TOP_LEFT
    case TOP_MIDDLE
    case TOP_RIGHT
    case MIDDLE_LEFT
    case CENTER
    case MIDDLE_RIGHT
    case BOTTOM_LEFT
    case BOTTOM_MIDDLE
    case BOTTOM_RIGHT
}

public enum type : String {
    
    case O = "O"
    case X = "X"
    case EMPTY = ""
    
}

public enum OXGameState : String {
    case inProgress
    case complete_no_one_won
    case complete_someone_won
    
}

class XOGame    {
    
    //the type of O or X that plays first
    private var startType:type = type.X
    //the board data, stored in a 1D array
    private var board = [type](count: 9, repeatedValue: type.EMPTY)
    
    
    //returns the number of turns the players have had on the board
    private func turn() -> Int {
        print(board.filter{(pos) in (pos != type.EMPTY)}.count)
        return board.filter{(pos) in (pos != type.EMPTY)}.count
    }
    
    //returns if its X or O's turn to play
    func whosTurn()  -> type {
        let count = turn()
        if (count % 2 == 0)   {
            return startType
        }   else    {
            
            if (startType == type.X)    {
                return type.O
            }   else    {
                return type.X
            }
        }
        
    }
    
    //the current state of the game
    func state() -> OXGameState    {
        if (turn() == 0)   {
            return OXGameState.inProgress
        }   else if (turn() < 9)  {
            
            //check if someone won on this turn
            let win = winDetection()
            
            //if noone won, game is still in progress
            if (win)   {
                return OXGameState.complete_someone_won
            }   else    {
                return OXGameState.inProgress
            }
            
            
            
        }   else    {
            return OXGameState.complete_no_one_won
        }
    }
    
    //one of the later functions created in the demo
    //execute the move in the game
    func playMove(position:Int) -> type? {
        board[position] = whosTurn()
        return board[position]
    }
    
    //restart the game
    func reset()    {
        board = [type](count: 9, repeatedValue: type.EMPTY)
    }
    
    func winDetection() -> Bool {
        return true
    }
}


//This class/stuff comes later
class XOGameController  {
    
    
    func newGame() -> XOGame  {
        return XOGame()
    }
    
}