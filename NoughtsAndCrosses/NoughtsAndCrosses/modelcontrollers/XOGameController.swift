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
    case hasntStarted
    case inProgress
    case complete
    
}

class XOGame    {
    
    private var startType:type = type.X
    private var board = [type](count: 9, repeatedValue: type.EMPTY)
    
    private func turn() -> Int {
        print(board.filter{(pos) in (pos != type.EMPTY)}.count)
        return board.filter{(pos) in (pos != type.EMPTY)}.count
    }
    
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
    
    func state() -> OXGameState    {
        if (turn() == 0)   {
            return OXGameState.hasntStarted
        }   else if (turn() < 9)  {
            return OXGameState.inProgress
        }   else    {
            return OXGameState.complete
        }
    }
    
    func playMove(position:Int) -> type? {
        board[position] = whosTurn()
        return board[position]
    }
    
    func reset()    {
        board = [type](count: 9, repeatedValue: type.EMPTY)
    }
}

class XOGameController  {
    
    
    func newGame() -> XOGame  {
        return XOGame()
    }
    
}