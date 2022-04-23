import UIKit
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum GameState{
    case start, win, lose, draw
}

enum Sign{
    case rock, paper, scissor
    
    var emoji: String{
        switch self{
        case .rock:
            return "✊"
        case .paper:
            return "✋"
        case .scissor:
            return "✌️"
        }
    }
    
    func match(robot: Sign) -> GameState {
        switch self{
        case .rock:
            switch robot{
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissor:
                return .win
            }
        case .paper:
            switch robot{
            case .rock:
                return .win
            case .paper:
                return .draw
            case .scissor:
                return .lose
            }
        case .scissor:
            switch robot{
            case .rock:
                return .lose
            case .paper:
                return .win
            case .scissor:
                return .draw
            }
        }
    }
}

func randomSign() -> Sign{
    let sign = randomChoice.nextInt()
    if sign == 0{
        return .rock
    } else if (sign == 1) {
        return .paper
    } else {
        return .scissor
    }
}

