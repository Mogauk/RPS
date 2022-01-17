//
//  ViewController.swift
//  RPS
//
//  Created by Alexey on 1/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var papper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    var currentGameState = GameState.start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetGame()
        
    }
    
    func resetGame() -> Void {
        appSign.text = "🤖"
        gameStatus.text = "Rock, Paper, Scissors?"
        rock.isHidden = false
        rock.isEnabled = true
        papper.isHidden = false
        papper.isEnabled = true
        scissors.isHidden = false
        scissors.isEnabled = true
        playAgain.isHidden = true
        self.view.backgroundColor = UIColor.gray
        
    }
    
    func play(_ playerTurn: Sign) {
        rock.isEnabled = false
        papper.isEnabled = false
        scissors.isEnabled = false
        
        let opponent = randomSign()
        appSign.text = opponent.emoji
        
        currentGameState = playerTurn.turn(opponent)
        
        switch currentGameState {
        case .start:
            gameStatus.text = "Rock, Papper, Scissors?"
        case .win:
            gameStatus.text = "You won!"
            self.view.backgroundColor = UIColor.green
        case .lose:
            gameStatus.text = "You lose!"
            self.view.backgroundColor = UIColor.red
        case .draw:
            gameStatus.text = "DRAW"
            gameStatus.textColor = UIColor.black
            self.view.backgroundColor = UIColor.yellow
        }
        
        switch playerTurn {
        case .rock:
            rock.isHidden = false
            papper.isHidden = true
            scissors.isHidden = true
        case .paper:
            rock.isHidden = true
            papper.isHidden = false
            scissors.isHidden = true
        case .scissors:
            rock.isHidden = true
            papper.isHidden = true
            scissors.isHidden = false
        }
        
        playAgain.isHidden = false
        
    }
    
    @IBAction func rockButton(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func papperButton(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func scissorsButton(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func playAgainButton(_ sender: UIButton) {
        resetGame()
    }
    
}

