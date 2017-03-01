//
//  GameViewController.swift
//  Hangman
//
//  Created by Adhyyan Narang on 2/27/17.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    var currentGame: Game!
    var phrases: HangmanPhrases!
    var gameHeaderView: GameHeaderView!
    var makeGuessButton: UIButton!
    var guess: GuessView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = phrases.getRandomPhrase()
        currentGame = Game(word: phrase)
        updateUI()
        setupUI()
    }
    
    func setupUI() {
    
        view.backgroundColor = UIColor.white
    
        gameHeaderView = GameHeaderView(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.1, width: view.frame.width * 0.8, height: 50))
        gameHeaderView.quitButton.addTarget(self, action: #selector(quitPressed), for: .touchUpInside)
        gameHeaderView.newGameButton.addTarget(self, action: #selector(newPressed), for: .touchUpInside)
        
        guess = GuessView(frame: CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.5, width: view.frame.width * 0.5, height: 50))
        
        makeGuessButton = UIButton(frame: CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.6, width: view.frame.width * 0.4, height: 50))
        makeGuessButton.addTarget(self, action: #selector(makeGuessPressed), for: .touchUpInside)
        makeGuessButton.setTitle("Make Guess!", for: .normal)
        makeGuessButton.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        makeGuessButton.setTitleColor(.black, for: .normal)
        makeGuessButton.titleLabel?.adjustsFontSizeToFitWidth = true
        makeGuessButton.titleLabel?.numberOfLines = 1
        makeGuessButton.clipsToBounds = true
        makeGuessButton.titleLabel?.textAlignment = .center
        
        view.addSubview(gameHeaderView)
        view.addSubview(guess)
        view.addSubview(makeGuessButton)
    }
    
    func quitPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func newPressed() {
        let newPhrase = phrases.getRandomPhrase()
        currentGame = Game(word: newPhrase)
        updateUI()
    }
    
    func makeGuessPressed() {
        if let extractedText = guess.guessTextField.text {
            let extractedChars = [Character](extractedText.characters)
            if extractedChars.count == 1 {
                if currentGame.incorrectGuess.contains(extractedChars[0]) || currentGame.correctGuess.contains(extractedChars[0]) {
                    let errorAlert = UIAlertController(title: "Error", message: "You have already made this guess.", preferredStyle: UIAlertControllerStyle.alert)
                    errorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                    self.present(errorAlert, animated: true, completion: nil)
                } else {
                    currentGame.makeGuess(guess: extractedChars[0])
                    updateUI()
                }
            } else {
                let errorAlert = UIAlertController(title: "Error", message: "Please input only one character at a time.", preferredStyle: UIAlertControllerStyle.alert)
                errorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(errorAlert, animated: true, completion: nil)
            }
        } else {
            let errorAlert = UIAlertController(title: "Error", message: "Please enter a character to guess.", preferredStyle: UIAlertControllerStyle.alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(errorAlert, animated: true, completion: nil)
        }
        if currentGame.progress == currentGame.word {
            displayWin()
        } else if (currentGame.numTries == currentGame.totalTries) {
            displayLoss()
        }
    }
    
    func displayWin() {
        let winAlert = UIAlertController(title: "Game Over", message: "You Win!", preferredStyle: UIAlertControllerStyle.alert)
        winAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            let newPhrase = self.phrases.getRandomPhrase()
            self.currentGame = Game(word: newPhrase)
            self.updateUI()
        }))
        self.present(winAlert, animated: true, completion: nil)
    }
    
    func displayLoss() {
        let lossAlert = UIAlertController(title: "Game Over", message: "You Lose!", preferredStyle: UIAlertControllerStyle.alert)
        lossAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            let newPhrase = self.phrases.getRandomPhrase()
            self.currentGame = Game(word: newPhrase)
            self.updateUI()
        }))
        self.present(lossAlert, animated: true, completion: nil)
    }
    
    func updateUI() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
