//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by 이성민 on 2022/04/23.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var robotResult: UILabel!
    @IBOutlet weak var finalResult: UILabel!
    
    let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

    enum GameState{
        case start, win, lose, draw
        var stateText: String{
            switch self{
            case .win:
                return "You Won!"
            case .lose:
                return "You Lose!"
            case .draw:
                return "Draw!"
            default:
                return "Rock, Paper, Scissors?"
            }
        }
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
    
    func showResult(you: Sign, robot: Sign){
        let result: GameState = you.match(robot: robot)
        robotResult.text = robot.emoji
        finalResult.text = result.stateText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yourChoiceRock(_ sender: Any) {
        let yourChoice: Sign
        yourChoice = .rock
        let robotChoice: Sign = randomSign()
        showResult(you: yourChoice, robot: robotChoice)
    }
    
    @IBAction func yourChoicePaper(_ sender: Any) {
        let yourChoice: Sign
        yourChoice = .paper
        let robotChoice: Sign = randomSign()
        showResult(you: yourChoice, robot: robotChoice)
    }
    
    @IBAction func yourChoiceScissor(_ sender: Any) {
        let yourChoice: Sign
        yourChoice = .scissor
        let robotChoice: Sign = randomSign()
        showResult(you: yourChoice, robot: robotChoice)
    }

}

