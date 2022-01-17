//
//  Sign.swift
//  RPS
//
//  Created by Alexey on 1/17/22.
//

import GameplayKit
import Foundation

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1{
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, scissors, paper
    
    var emoji: String {
        switch self {
        case .rock:
            return  "👊🏻"
        case .paper:
            return  "✋🏻"
        case .scissors:
            return  "✌🏻"
        }
    }
    
    func turn(_ oponentTurn: Sign) -> GameState {
        switch self {
        case .rock:
            switch oponentTurn {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch oponentTurn {
            case .rock:
                return .win
            case .paper:
                return .draw
            case .scissors:
                return .lose
            }
        case .scissors:
            switch oponentTurn {
            case .rock:
                return .lose
            case .paper:
                return .win
            case .scissors:
                return .draw
            }
        }
    }
    
}



